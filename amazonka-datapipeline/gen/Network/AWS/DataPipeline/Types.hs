{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric      #-}
{-# LANGUAGE LambdaCase         #-}
{-# LANGUAGE OverloadedStrings  #-}
{-# LANGUAGE RecordWildCards    #-}
{-# LANGUAGE TypeFamilies       #-}

-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- |
-- Module      : Network.AWS.DataPipeline.Types
-- Copyright   : (c) 2013-2015 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)
--
module Network.AWS.DataPipeline.Types
    (
    -- * Service
      DataPipeline

    -- * Errors
    , _InvalidRequestException
    , _InternalServiceError
    , _PipelineDeletedException
    , _PipelineNotFoundException
    , _TaskNotFoundException

    -- * OperatorType
    , OperatorType (..)

    -- * TaskStatus
    , TaskStatus (..)

    -- * Field
    , Field
    , field
    , fieRefValue
    , fieStringValue
    , fieKey

    -- * InstanceIdentity
    , InstanceIdentity
    , instanceIdentity
    , iiSignature
    , iiDocument

    -- * Operator
    , Operator
    , operator
    , opeValues
    , opeType

    -- * ParameterAttribute
    , ParameterAttribute
    , parameterAttribute
    , paKey
    , paStringValue

    -- * ParameterObject
    , ParameterObject
    , parameterObject
    , poId
    , poAttributes

    -- * ParameterValue
    , ParameterValue
    , parameterValue
    , pvId
    , pvStringValue

    -- * PipelineDescription
    , PipelineDescription
    , pipelineDescription
    , pdDescription
    , pdTags
    , pdPipelineId
    , pdName
    , pdFields

    -- * PipelineIdName
    , PipelineIdName
    , pipelineIdName
    , pinName
    , pinId

    -- * PipelineObject
    , PipelineObject
    , pipelineObject
    , pipId
    , pipName
    , pipFields

    -- * Query
    , Query
    , query
    , queSelectors

    -- * Selector
    , Selector
    , selector
    , selOperator
    , selFieldName

    -- * Tag
    , Tag
    , tag
    , tagKey
    , tagValue

    -- * TaskObject
    , TaskObject
    , taskObject
    , toPipelineId
    , toTaskId
    , toAttemptId
    , toObjects

    -- * ValidationError
    , ValidationError
    , validationError
    , veId
    , veErrors

    -- * ValidationWarning
    , ValidationWarning
    , validationWarning
    , vwWarnings
    , vwId
    ) where

import           Network.AWS.Prelude
import           Network.AWS.Sign.V4

-- | Version @2012-10-29@ of the Amazon Data Pipeline SDK.
data DataPipeline

instance AWSService DataPipeline where
    type Sg DataPipeline = V4
    service = const svc
      where
        svc =
            Service
            { _svcAbbrev = "DataPipeline"
            , _svcPrefix = "datapipeline"
            , _svcVersion = "2012-10-29"
            , _svcEndpoint = defaultEndpoint svc
            , _svcTimeout = Just 70000000
            , _svcStatus = statusSuccess
            , _svcError = parseJSONError
            , _svcRetry = retry
            }
        retry =
            Exponential
            { _retryBase = 5.0e-2
            , _retryGrowth = 2
            , _retryAttempts = 5
            , _retryCheck = check
            }
        check e
          | has (hasCode "ThrottlingException" . hasStatus 400) e =
              Just "throttling_exception"
          | has (hasCode "Throttling" . hasStatus 400) e = Just "throttling"
          | has (hasStatus 503) e = Just "service_unavailable"
          | has (hasStatus 500) e = Just "general_server_error"
          | has (hasStatus 509) e = Just "limit_exceeded"
          | otherwise = Nothing

-- | The request was not valid. Verify that your request was properly
-- formatted, that the signature was generated with the correct
-- credentials, and that you haven\'t exceeded any of the service limits
-- for your account.
_InvalidRequestException :: AWSError a => Getting (First ServiceError) a ServiceError
_InvalidRequestException = _ServiceError . hasCode "InvalidRequestException"

-- | An internal service error occurred.
_InternalServiceError :: AWSError a => Getting (First ServiceError) a ServiceError
_InternalServiceError = _ServiceError . hasCode "InternalServiceError"

-- | The specified pipeline has been deleted.
_PipelineDeletedException :: AWSError a => Getting (First ServiceError) a ServiceError
_PipelineDeletedException = _ServiceError . hasCode "PipelineDeletedException"

-- | The specified pipeline was not found. Verify that you used the correct
-- user and account identifiers.
_PipelineNotFoundException :: AWSError a => Getting (First ServiceError) a ServiceError
_PipelineNotFoundException =
    _ServiceError . hasCode "PipelineNotFoundException"

-- | The specified task was not found.
_TaskNotFoundException :: AWSError a => Getting (First ServiceError) a ServiceError
_TaskNotFoundException = _ServiceError . hasCode "TaskNotFoundException"

data OperatorType
    = OperatorGE
    | OperatorEQ'
    | OperatorBetween
    | OperatorRefEQ
    | OperatorLE
    deriving (Eq,Ord,Read,Show,Enum,Data,Typeable,Generic)

instance FromText OperatorType where
    parser = takeLowerText >>= \case
        "between" -> pure OperatorBetween
        "eq" -> pure OperatorEQ'
        "ge" -> pure OperatorGE
        "le" -> pure OperatorLE
        "ref_eq" -> pure OperatorRefEQ
        e -> fromTextError $ "Failure parsing OperatorType from value: '" <> e
           <> "'. Accepted values: between, eq, ge, le, ref_eq"

instance ToText OperatorType where
    toText = \case
        OperatorBetween -> "between"
        OperatorEQ' -> "eq"
        OperatorGE -> "ge"
        OperatorLE -> "le"
        OperatorRefEQ -> "ref_eq"

instance Hashable OperatorType
instance ToQuery OperatorType
instance ToHeader OperatorType

instance ToJSON OperatorType where
    toJSON = toJSONText

data TaskStatus
    = Finished
    | False'
    | Failed
    deriving (Eq,Ord,Read,Show,Enum,Data,Typeable,Generic)

instance FromText TaskStatus where
    parser = takeLowerText >>= \case
        "failed" -> pure Failed
        "false" -> pure False'
        "finished" -> pure Finished
        e -> fromTextError $ "Failure parsing TaskStatus from value: '" <> e
           <> "'. Accepted values: failed, false, finished"

instance ToText TaskStatus where
    toText = \case
        Failed -> "failed"
        False' -> "false"
        Finished -> "finished"

instance Hashable TaskStatus
instance ToQuery TaskStatus
instance ToHeader TaskStatus

instance ToJSON TaskStatus where
    toJSON = toJSONText

-- | A key-value pair that describes a property of a pipeline object. The
-- value is specified as either a string value (@StringValue@) or a
-- reference to another object (@RefValue@) but not as both.
--
-- /See:/ 'field' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'fieRefValue'
--
-- * 'fieStringValue'
--
-- * 'fieKey'
data Field = Field'
    { _fieRefValue    :: !(Maybe Text)
    , _fieStringValue :: !(Maybe Text)
    , _fieKey         :: !Text
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | 'Field' smart constructor.
field :: Text -> Field
field pKey =
    Field'
    { _fieRefValue = Nothing
    , _fieStringValue = Nothing
    , _fieKey = pKey
    }

-- | The field value, expressed as the identifier of another object.
fieRefValue :: Lens' Field (Maybe Text)
fieRefValue = lens _fieRefValue (\ s a -> s{_fieRefValue = a});

-- | The field value, expressed as a String.
fieStringValue :: Lens' Field (Maybe Text)
fieStringValue = lens _fieStringValue (\ s a -> s{_fieStringValue = a});

-- | The field identifier.
fieKey :: Lens' Field Text
fieKey = lens _fieKey (\ s a -> s{_fieKey = a});

instance FromJSON Field where
        parseJSON
          = withObject "Field"
              (\ x ->
                 Field' <$>
                   (x .:? "refValue") <*> (x .:? "stringValue") <*>
                     (x .: "key"))

instance ToJSON Field where
        toJSON Field'{..}
          = object
              ["refValue" .= _fieRefValue,
               "stringValue" .= _fieStringValue, "key" .= _fieKey]

-- | Identity information for the EC2 instance that is hosting the task
-- runner. You can get this value by calling a metadata URI from the EC2
-- instance. For more information, see
-- <http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/AESDG-chapter-instancedata.html Instance Metadata>
-- in the /Amazon Elastic Compute Cloud User Guide./ Passing in this value
-- proves that your task runner is running on an EC2 instance, and ensures
-- the proper AWS Data Pipeline service charges are applied to your
-- pipeline.
--
-- /See:/ 'instanceIdentity' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'iiSignature'
--
-- * 'iiDocument'
data InstanceIdentity = InstanceIdentity'
    { _iiSignature :: !(Maybe Text)
    , _iiDocument  :: !(Maybe Text)
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | 'InstanceIdentity' smart constructor.
instanceIdentity :: InstanceIdentity
instanceIdentity =
    InstanceIdentity'
    { _iiSignature = Nothing
    , _iiDocument = Nothing
    }

-- | A signature which can be used to verify the accuracy and authenticity of
-- the information provided in the instance identity document.
iiSignature :: Lens' InstanceIdentity (Maybe Text)
iiSignature = lens _iiSignature (\ s a -> s{_iiSignature = a});

-- | A description of an EC2 instance that is generated when the instance is
-- launched and exposed to the instance via the instance metadata service
-- in the form of a JSON representation of an object.
iiDocument :: Lens' InstanceIdentity (Maybe Text)
iiDocument = lens _iiDocument (\ s a -> s{_iiDocument = a});

instance ToJSON InstanceIdentity where
        toJSON InstanceIdentity'{..}
          = object
              ["signature" .= _iiSignature,
               "document" .= _iiDocument]

-- | Contains a logical operation for comparing the value of a field with a
-- specified value.
--
-- /See:/ 'operator' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'opeValues'
--
-- * 'opeType'
data Operator = Operator'
    { _opeValues :: !(Maybe [Text])
    , _opeType   :: !(Maybe OperatorType)
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | 'Operator' smart constructor.
operator :: Operator
operator =
    Operator'
    { _opeValues = Nothing
    , _opeType = Nothing
    }

-- | The value that the actual field value will be compared with.
opeValues :: Lens' Operator [Text]
opeValues = lens _opeValues (\ s a -> s{_opeValues = a}) . _Default;

-- | The logical operation to be performed: equal (@EQ@), equal reference
-- (@REF_EQ@), less than or equal (@LE@), greater than or equal (@GE@), or
-- between (@BETWEEN@). Equal reference (@REF_EQ@) can be used only with
-- reference fields. The other comparison types can be used only with
-- String fields. The comparison types you can use apply only to certain
-- object fields, as detailed below.
--
-- The comparison operators EQ and REF_EQ act on the following fields:
--
-- -   name
-- -   \@sphere
-- -   parent
-- -   \@componentParent
-- -   \@instanceParent
-- -   \@status
-- -   \@scheduledStartTime
-- -   \@scheduledEndTime
-- -   \@actualStartTime
-- -   \@actualEndTime
--
-- The comparison operators @GE@, @LE@, and @BETWEEN@ act on the following
-- fields:
--
-- -   \@scheduledStartTime
-- -   \@scheduledEndTime
-- -   \@actualStartTime
-- -   \@actualEndTime
--
-- Note that fields beginning with the at sign (\@) are read-only and set
-- by the web service. When you name fields, you should choose names
-- containing only alpha-numeric values, as symbols may be reserved by AWS
-- Data Pipeline. User-defined fields that you add to a pipeline should
-- prefix their name with the string \"my\".
opeType :: Lens' Operator (Maybe OperatorType)
opeType = lens _opeType (\ s a -> s{_opeType = a});

instance ToJSON Operator where
        toJSON Operator'{..}
          = object ["values" .= _opeValues, "type" .= _opeType]

-- | The attributes allowed or specified with a parameter object.
--
-- /See:/ 'parameterAttribute' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'paKey'
--
-- * 'paStringValue'
data ParameterAttribute = ParameterAttribute'
    { _paKey         :: !Text
    , _paStringValue :: !Text
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | 'ParameterAttribute' smart constructor.
parameterAttribute :: Text -> Text -> ParameterAttribute
parameterAttribute pKey pStringValue =
    ParameterAttribute'
    { _paKey = pKey
    , _paStringValue = pStringValue
    }

-- | The field identifier.
paKey :: Lens' ParameterAttribute Text
paKey = lens _paKey (\ s a -> s{_paKey = a});

-- | The field value, expressed as a String.
paStringValue :: Lens' ParameterAttribute Text
paStringValue = lens _paStringValue (\ s a -> s{_paStringValue = a});

instance FromJSON ParameterAttribute where
        parseJSON
          = withObject "ParameterAttribute"
              (\ x ->
                 ParameterAttribute' <$>
                   (x .: "key") <*> (x .: "stringValue"))

instance ToJSON ParameterAttribute where
        toJSON ParameterAttribute'{..}
          = object
              ["key" .= _paKey, "stringValue" .= _paStringValue]

-- | Contains information about a parameter object.
--
-- /See:/ 'parameterObject' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'poId'
--
-- * 'poAttributes'
data ParameterObject = ParameterObject'
    { _poId         :: !Text
    , _poAttributes :: ![ParameterAttribute]
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | 'ParameterObject' smart constructor.
parameterObject :: Text -> ParameterObject
parameterObject pId =
    ParameterObject'
    { _poId = pId
    , _poAttributes = mempty
    }

-- | The ID of the parameter object.
poId :: Lens' ParameterObject Text
poId = lens _poId (\ s a -> s{_poId = a});

-- | The attributes of the parameter object.
poAttributes :: Lens' ParameterObject [ParameterAttribute]
poAttributes = lens _poAttributes (\ s a -> s{_poAttributes = a});

instance FromJSON ParameterObject where
        parseJSON
          = withObject "ParameterObject"
              (\ x ->
                 ParameterObject' <$>
                   (x .: "id") <*> (x .:? "attributes" .!= mempty))

instance ToJSON ParameterObject where
        toJSON ParameterObject'{..}
          = object
              ["id" .= _poId, "attributes" .= _poAttributes]

-- | A value or list of parameter values.
--
-- /See:/ 'parameterValue' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'pvId'
--
-- * 'pvStringValue'
data ParameterValue = ParameterValue'
    { _pvId          :: !Text
    , _pvStringValue :: !Text
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | 'ParameterValue' smart constructor.
parameterValue :: Text -> Text -> ParameterValue
parameterValue pId pStringValue =
    ParameterValue'
    { _pvId = pId
    , _pvStringValue = pStringValue
    }

-- | The ID of the parameter value.
pvId :: Lens' ParameterValue Text
pvId = lens _pvId (\ s a -> s{_pvId = a});

-- | The field value, expressed as a String.
pvStringValue :: Lens' ParameterValue Text
pvStringValue = lens _pvStringValue (\ s a -> s{_pvStringValue = a});

instance FromJSON ParameterValue where
        parseJSON
          = withObject "ParameterValue"
              (\ x ->
                 ParameterValue' <$>
                   (x .: "id") <*> (x .: "stringValue"))

instance ToJSON ParameterValue where
        toJSON ParameterValue'{..}
          = object
              ["id" .= _pvId, "stringValue" .= _pvStringValue]

-- | Contains pipeline metadata.
--
-- /See:/ 'pipelineDescription' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'pdDescription'
--
-- * 'pdTags'
--
-- * 'pdPipelineId'
--
-- * 'pdName'
--
-- * 'pdFields'
data PipelineDescription = PipelineDescription'
    { _pdDescription :: !(Maybe Text)
    , _pdTags        :: !(Maybe [Tag])
    , _pdPipelineId  :: !Text
    , _pdName        :: !Text
    , _pdFields      :: ![Field]
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | 'PipelineDescription' smart constructor.
pipelineDescription :: Text -> Text -> PipelineDescription
pipelineDescription pPipelineId pName =
    PipelineDescription'
    { _pdDescription = Nothing
    , _pdTags = Nothing
    , _pdPipelineId = pPipelineId
    , _pdName = pName
    , _pdFields = mempty
    }

-- | Description of the pipeline.
pdDescription :: Lens' PipelineDescription (Maybe Text)
pdDescription = lens _pdDescription (\ s a -> s{_pdDescription = a});

-- | A list of tags to associated with a pipeline. Tags let you control
-- access to pipelines. For more information, see
-- <http://docs.aws.amazon.com/datapipeline/latest/DeveloperGuide/dp-control-access.html Controlling User Access to Pipelines>
-- in the /AWS Data Pipeline Developer Guide/.
pdTags :: Lens' PipelineDescription [Tag]
pdTags = lens _pdTags (\ s a -> s{_pdTags = a}) . _Default;

-- | The pipeline identifier that was assigned by AWS Data Pipeline. This is
-- a string of the form @df-297EG78HU43EEXAMPLE@.
pdPipelineId :: Lens' PipelineDescription Text
pdPipelineId = lens _pdPipelineId (\ s a -> s{_pdPipelineId = a});

-- | The name of the pipeline.
pdName :: Lens' PipelineDescription Text
pdName = lens _pdName (\ s a -> s{_pdName = a});

-- | A list of read-only fields that contain metadata about the pipeline:
-- \@userId, \@accountId, and \@pipelineState.
pdFields :: Lens' PipelineDescription [Field]
pdFields = lens _pdFields (\ s a -> s{_pdFields = a});

instance FromJSON PipelineDescription where
        parseJSON
          = withObject "PipelineDescription"
              (\ x ->
                 PipelineDescription' <$>
                   (x .:? "description") <*> (x .:? "tags" .!= mempty)
                     <*> (x .: "pipelineId")
                     <*> (x .: "name")
                     <*> (x .:? "fields" .!= mempty))

-- | Contains the name and identifier of a pipeline.
--
-- /See:/ 'pipelineIdName' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'pinName'
--
-- * 'pinId'
data PipelineIdName = PipelineIdName'
    { _pinName :: !(Maybe Text)
    , _pinId   :: !(Maybe Text)
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | 'PipelineIdName' smart constructor.
pipelineIdName :: PipelineIdName
pipelineIdName =
    PipelineIdName'
    { _pinName = Nothing
    , _pinId = Nothing
    }

-- | The name of the pipeline.
pinName :: Lens' PipelineIdName (Maybe Text)
pinName = lens _pinName (\ s a -> s{_pinName = a});

-- | The ID of the pipeline that was assigned by AWS Data Pipeline. This is a
-- string of the form @df-297EG78HU43EEXAMPLE@.
pinId :: Lens' PipelineIdName (Maybe Text)
pinId = lens _pinId (\ s a -> s{_pinId = a});

instance FromJSON PipelineIdName where
        parseJSON
          = withObject "PipelineIdName"
              (\ x ->
                 PipelineIdName' <$> (x .:? "name") <*> (x .:? "id"))

-- | Contains information about a pipeline object. This can be a logical,
-- physical, or physical attempt pipeline object. The complete set of
-- components of a pipeline defines the pipeline.
--
-- /See:/ 'pipelineObject' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'pipId'
--
-- * 'pipName'
--
-- * 'pipFields'
data PipelineObject = PipelineObject'
    { _pipId     :: !Text
    , _pipName   :: !Text
    , _pipFields :: ![Field]
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | 'PipelineObject' smart constructor.
pipelineObject :: Text -> Text -> PipelineObject
pipelineObject pId pName =
    PipelineObject'
    { _pipId = pId
    , _pipName = pName
    , _pipFields = mempty
    }

-- | The ID of the object.
pipId :: Lens' PipelineObject Text
pipId = lens _pipId (\ s a -> s{_pipId = a});

-- | The name of the object.
pipName :: Lens' PipelineObject Text
pipName = lens _pipName (\ s a -> s{_pipName = a});

-- | Key-value pairs that define the properties of the object.
pipFields :: Lens' PipelineObject [Field]
pipFields = lens _pipFields (\ s a -> s{_pipFields = a});

instance FromJSON PipelineObject where
        parseJSON
          = withObject "PipelineObject"
              (\ x ->
                 PipelineObject' <$>
                   (x .: "id") <*> (x .: "name") <*>
                     (x .:? "fields" .!= mempty))

instance ToJSON PipelineObject where
        toJSON PipelineObject'{..}
          = object
              ["id" .= _pipId, "name" .= _pipName,
               "fields" .= _pipFields]

-- | Defines the query to run against an object.
--
-- /See:/ 'query' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'queSelectors'
newtype Query = Query'
    { _queSelectors :: Maybe [Selector]
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | 'Query' smart constructor.
query :: Query
query =
    Query'
    { _queSelectors = Nothing
    }

-- | List of selectors that define the query. An object must satisfy all of
-- the selectors to match the query.
queSelectors :: Lens' Query [Selector]
queSelectors = lens _queSelectors (\ s a -> s{_queSelectors = a}) . _Default;

instance ToJSON Query where
        toJSON Query'{..}
          = object ["selectors" .= _queSelectors]

-- | A comparision that is used to determine whether a query should return
-- this object.
--
-- /See:/ 'selector' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'selOperator'
--
-- * 'selFieldName'
data Selector = Selector'
    { _selOperator  :: !(Maybe Operator)
    , _selFieldName :: !(Maybe Text)
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | 'Selector' smart constructor.
selector :: Selector
selector =
    Selector'
    { _selOperator = Nothing
    , _selFieldName = Nothing
    }

-- | FIXME: Undocumented member.
selOperator :: Lens' Selector (Maybe Operator)
selOperator = lens _selOperator (\ s a -> s{_selOperator = a});

-- | The name of the field that the operator will be applied to. The field
-- name is the \"key\" portion of the field definition in the pipeline
-- definition syntax that is used by the AWS Data Pipeline API. If the
-- field is not set on the object, the condition fails.
selFieldName :: Lens' Selector (Maybe Text)
selFieldName = lens _selFieldName (\ s a -> s{_selFieldName = a});

instance ToJSON Selector where
        toJSON Selector'{..}
          = object
              ["operator" .= _selOperator,
               "fieldName" .= _selFieldName]

-- | Tags are key\/value pairs defined by a user and associated with a
-- pipeline to control access. AWS Data Pipeline allows you to associate
-- ten tags per pipeline. For more information, see
-- <http://docs.aws.amazon.com/datapipeline/latest/DeveloperGuide/dp-control-access.html Controlling User Access to Pipelines>
-- in the /AWS Data Pipeline Developer Guide/.
--
-- /See:/ 'tag' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'tagKey'
--
-- * 'tagValue'
data Tag = Tag'
    { _tagKey   :: !Text
    , _tagValue :: !Text
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | 'Tag' smart constructor.
tag :: Text -> Text -> Tag
tag pKey pValue =
    Tag'
    { _tagKey = pKey
    , _tagValue = pValue
    }

-- | The key name of a tag defined by a user. For more information, see
-- <http://docs.aws.amazon.com/datapipeline/latest/DeveloperGuide/dp-control-access.html Controlling User Access to Pipelines>
-- in the /AWS Data Pipeline Developer Guide/.
tagKey :: Lens' Tag Text
tagKey = lens _tagKey (\ s a -> s{_tagKey = a});

-- | The optional value portion of a tag defined by a user. For more
-- information, see
-- <http://docs.aws.amazon.com/datapipeline/latest/DeveloperGuide/dp-control-access.html Controlling User Access to Pipelines>
-- in the /AWS Data Pipeline Developer Guide/.
tagValue :: Lens' Tag Text
tagValue = lens _tagValue (\ s a -> s{_tagValue = a});

instance FromJSON Tag where
        parseJSON
          = withObject "Tag"
              (\ x -> Tag' <$> (x .: "key") <*> (x .: "value"))

instance ToJSON Tag where
        toJSON Tag'{..}
          = object ["key" .= _tagKey, "value" .= _tagValue]

-- | Contains information about a pipeline task that is assigned to a task
-- runner.
--
-- /See:/ 'taskObject' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'toPipelineId'
--
-- * 'toTaskId'
--
-- * 'toAttemptId'
--
-- * 'toObjects'
data TaskObject = TaskObject'
    { _toPipelineId :: !(Maybe Text)
    , _toTaskId     :: !(Maybe Text)
    , _toAttemptId  :: !(Maybe Text)
    , _toObjects    :: !(Maybe (Map Text PipelineObject))
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | 'TaskObject' smart constructor.
taskObject :: TaskObject
taskObject =
    TaskObject'
    { _toPipelineId = Nothing
    , _toTaskId = Nothing
    , _toAttemptId = Nothing
    , _toObjects = Nothing
    }

-- | The ID of the pipeline that provided the task.
toPipelineId :: Lens' TaskObject (Maybe Text)
toPipelineId = lens _toPipelineId (\ s a -> s{_toPipelineId = a});

-- | An internal identifier for the task. This ID is passed to the
-- SetTaskStatus and ReportTaskProgress actions.
toTaskId :: Lens' TaskObject (Maybe Text)
toTaskId = lens _toTaskId (\ s a -> s{_toTaskId = a});

-- | The ID of the pipeline task attempt object. AWS Data Pipeline uses this
-- value to track how many times a task is attempted.
toAttemptId :: Lens' TaskObject (Maybe Text)
toAttemptId = lens _toAttemptId (\ s a -> s{_toAttemptId = a});

-- | Connection information for the location where the task runner will
-- publish the output of the task.
toObjects :: Lens' TaskObject (HashMap Text PipelineObject)
toObjects = lens _toObjects (\ s a -> s{_toObjects = a}) . _Default . _Map;

instance FromJSON TaskObject where
        parseJSON
          = withObject "TaskObject"
              (\ x ->
                 TaskObject' <$>
                   (x .:? "pipelineId") <*> (x .:? "taskId") <*>
                     (x .:? "attemptId")
                     <*> (x .:? "objects" .!= mempty))

-- | Defines a validation error. Validation errors prevent pipeline
-- activation. The set of validation errors that can be returned are
-- defined by AWS Data Pipeline.
--
-- /See:/ 'validationError' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'veId'
--
-- * 'veErrors'
data ValidationError = ValidationError'
    { _veId     :: !(Maybe Text)
    , _veErrors :: !(Maybe [Text])
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | 'ValidationError' smart constructor.
validationError :: ValidationError
validationError =
    ValidationError'
    { _veId = Nothing
    , _veErrors = Nothing
    }

-- | The identifier of the object that contains the validation error.
veId :: Lens' ValidationError (Maybe Text)
veId = lens _veId (\ s a -> s{_veId = a});

-- | A description of the validation error.
veErrors :: Lens' ValidationError [Text]
veErrors = lens _veErrors (\ s a -> s{_veErrors = a}) . _Default;

instance FromJSON ValidationError where
        parseJSON
          = withObject "ValidationError"
              (\ x ->
                 ValidationError' <$>
                   (x .:? "id") <*> (x .:? "errors" .!= mempty))

-- | Defines a validation warning. Validation warnings do not prevent
-- pipeline activation. The set of validation warnings that can be returned
-- are defined by AWS Data Pipeline.
--
-- /See:/ 'validationWarning' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'vwWarnings'
--
-- * 'vwId'
data ValidationWarning = ValidationWarning'
    { _vwWarnings :: !(Maybe [Text])
    , _vwId       :: !(Maybe Text)
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | 'ValidationWarning' smart constructor.
validationWarning :: ValidationWarning
validationWarning =
    ValidationWarning'
    { _vwWarnings = Nothing
    , _vwId = Nothing
    }

-- | A description of the validation warning.
vwWarnings :: Lens' ValidationWarning [Text]
vwWarnings = lens _vwWarnings (\ s a -> s{_vwWarnings = a}) . _Default;

-- | The identifier of the object that contains the validation warning.
vwId :: Lens' ValidationWarning (Maybe Text)
vwId = lens _vwId (\ s a -> s{_vwId = a});

instance FromJSON ValidationWarning where
        parseJSON
          = withObject "ValidationWarning"
              (\ x ->
                 ValidationWarning' <$>
                   (x .:? "warnings" .!= mempty) <*> (x .:? "id"))
