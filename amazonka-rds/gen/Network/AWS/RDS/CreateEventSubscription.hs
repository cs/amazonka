{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric      #-}
{-# LANGUAGE OverloadedStrings  #-}
{-# LANGUAGE RecordWildCards    #-}
{-# LANGUAGE TypeFamilies       #-}

-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- |
-- Module      : Network.AWS.RDS.CreateEventSubscription
-- Copyright   : (c) 2013-2015 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)
--
-- | Creates an RDS event notification subscription. This action requires a
-- topic ARN (Amazon Resource Name) created by either the RDS console, the
-- SNS console, or the SNS API. To obtain an ARN with SNS, you must create
-- a topic in Amazon SNS and subscribe to the topic. The ARN is displayed
-- in the SNS console.
--
-- You can specify the type of source (SourceType) you want to be notified
-- of, provide a list of RDS sources (SourceIds) that triggers the events,
-- and provide a list of event categories (EventCategories) for events you
-- want to be notified of. For example, you can specify SourceType =
-- db-instance, SourceIds = mydbinstance1, mydbinstance2 and
-- EventCategories = Availability, Backup.
--
-- If you specify both the SourceType and SourceIds, such as SourceType =
-- db-instance and SourceIdentifier = myDBInstance1, you will be notified
-- of all the db-instance events for the specified source. If you specify a
-- SourceType but do not specify a SourceIdentifier, you will receive
-- notice of the events for that source type for all your RDS sources. If
-- you do not specify either the SourceType nor the SourceIdentifier, you
-- will be notified of events generated from all RDS sources belonging to
-- your customer account.
--
-- <http://docs.aws.amazon.com/AmazonRDS/latest/APIReference/API_CreateEventSubscription.html>
module Network.AWS.RDS.CreateEventSubscription
    (
    -- * Request
      CreateEventSubscription
    -- ** Request constructor
    , createEventSubscription
    -- ** Request lenses
    , cesEnabled
    , cesSourceType
    , cesEventCategories
    , cesSourceIds
    , cesTags
    , cesSubscriptionName
    , cesSNSTopicARN

    -- * Response
    , CreateEventSubscriptionResponse
    -- ** Response constructor
    , createEventSubscriptionResponse
    -- ** Response lenses
    , cesrEventSubscription
    , cesrStatus
    ) where

import           Network.AWS.Prelude
import           Network.AWS.RDS.Types
import           Network.AWS.Request
import           Network.AWS.Response

-- |
--
-- /See:/ 'createEventSubscription' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'cesEnabled'
--
-- * 'cesSourceType'
--
-- * 'cesEventCategories'
--
-- * 'cesSourceIds'
--
-- * 'cesTags'
--
-- * 'cesSubscriptionName'
--
-- * 'cesSNSTopicARN'
data CreateEventSubscription = CreateEventSubscription'
    { _cesEnabled          :: !(Maybe Bool)
    , _cesSourceType       :: !(Maybe Text)
    , _cesEventCategories  :: !(Maybe [Text])
    , _cesSourceIds        :: !(Maybe [Text])
    , _cesTags             :: !(Maybe [Tag])
    , _cesSubscriptionName :: !Text
    , _cesSNSTopicARN      :: !Text
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | 'CreateEventSubscription' smart constructor.
createEventSubscription :: Text -> Text -> CreateEventSubscription
createEventSubscription pSubscriptionName pSNSTopicARN =
    CreateEventSubscription'
    { _cesEnabled = Nothing
    , _cesSourceType = Nothing
    , _cesEventCategories = Nothing
    , _cesSourceIds = Nothing
    , _cesTags = Nothing
    , _cesSubscriptionName = pSubscriptionName
    , _cesSNSTopicARN = pSNSTopicARN
    }

-- | A Boolean value; set to __true__ to activate the subscription, set to
-- __false__ to create the subscription but not active it.
cesEnabled :: Lens' CreateEventSubscription (Maybe Bool)
cesEnabled = lens _cesEnabled (\ s a -> s{_cesEnabled = a});

-- | The type of source that will be generating the events. For example, if
-- you want to be notified of events generated by a DB instance, you would
-- set this parameter to db-instance. if this value is not specified, all
-- events are returned.
--
-- Valid values: db-instance | db-parameter-group | db-security-group |
-- db-snapshot
cesSourceType :: Lens' CreateEventSubscription (Maybe Text)
cesSourceType = lens _cesSourceType (\ s a -> s{_cesSourceType = a});

-- | A list of event categories for a SourceType that you want to subscribe
-- to. You can see a list of the categories for a given SourceType in the
-- <http://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_Events.html Events>
-- topic in the Amazon RDS User Guide or by using the
-- __DescribeEventCategories__ action.
cesEventCategories :: Lens' CreateEventSubscription [Text]
cesEventCategories = lens _cesEventCategories (\ s a -> s{_cesEventCategories = a}) . _Default;

-- | The list of identifiers of the event sources for which events will be
-- returned. If not specified, then all sources are included in the
-- response. An identifier must begin with a letter and must contain only
-- ASCII letters, digits, and hyphens; it cannot end with a hyphen or
-- contain two consecutive hyphens.
--
-- Constraints:
--
-- -   If SourceIds are supplied, SourceType must also be provided.
-- -   If the source type is a DB instance, then a @DBInstanceIdentifier@
--     must be supplied.
-- -   If the source type is a DB security group, a @DBSecurityGroupName@
--     must be supplied.
-- -   If the source type is a DB parameter group, a @DBParameterGroupName@
--     must be supplied.
-- -   If the source type is a DB snapshot, a @DBSnapshotIdentifier@ must
--     be supplied.
cesSourceIds :: Lens' CreateEventSubscription [Text]
cesSourceIds = lens _cesSourceIds (\ s a -> s{_cesSourceIds = a}) . _Default;

-- | FIXME: Undocumented member.
cesTags :: Lens' CreateEventSubscription [Tag]
cesTags = lens _cesTags (\ s a -> s{_cesTags = a}) . _Default;

-- | The name of the subscription.
--
-- Constraints: The name must be less than 255 characters.
cesSubscriptionName :: Lens' CreateEventSubscription Text
cesSubscriptionName = lens _cesSubscriptionName (\ s a -> s{_cesSubscriptionName = a});

-- | The Amazon Resource Name (ARN) of the SNS topic created for event
-- notification. The ARN is created by Amazon SNS when you create a topic
-- and subscribe to it.
cesSNSTopicARN :: Lens' CreateEventSubscription Text
cesSNSTopicARN = lens _cesSNSTopicARN (\ s a -> s{_cesSNSTopicARN = a});

instance AWSRequest CreateEventSubscription where
        type Sv CreateEventSubscription = RDS
        type Rs CreateEventSubscription =
             CreateEventSubscriptionResponse
        request = post
        response
          = receiveXMLWrapper "CreateEventSubscriptionResult"
              (\ s h x ->
                 CreateEventSubscriptionResponse' <$>
                   (x .@? "EventSubscription") <*> (pure (fromEnum s)))

instance ToHeaders CreateEventSubscription where
        toHeaders = const mempty

instance ToPath CreateEventSubscription where
        toPath = const "/"

instance ToQuery CreateEventSubscription where
        toQuery CreateEventSubscription'{..}
          = mconcat
              ["Action" =:
                 ("CreateEventSubscription" :: ByteString),
               "Version" =: ("2014-10-31" :: ByteString),
               "Enabled" =: _cesEnabled,
               "SourceType" =: _cesSourceType,
               "EventCategories" =:
                 toQuery
                   (toQueryList "EventCategory" <$>
                      _cesEventCategories),
               "SourceIds" =:
                 toQuery (toQueryList "SourceId" <$> _cesSourceIds),
               "Tags" =: toQuery (toQueryList "Tag" <$> _cesTags),
               "SubscriptionName" =: _cesSubscriptionName,
               "SnsTopicArn" =: _cesSNSTopicARN]

-- | /See:/ 'createEventSubscriptionResponse' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'cesrEventSubscription'
--
-- * 'cesrStatus'
data CreateEventSubscriptionResponse = CreateEventSubscriptionResponse'
    { _cesrEventSubscription :: !(Maybe EventSubscription)
    , _cesrStatus            :: !Int
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | 'CreateEventSubscriptionResponse' smart constructor.
createEventSubscriptionResponse :: Int -> CreateEventSubscriptionResponse
createEventSubscriptionResponse pStatus =
    CreateEventSubscriptionResponse'
    { _cesrEventSubscription = Nothing
    , _cesrStatus = pStatus
    }

-- | FIXME: Undocumented member.
cesrEventSubscription :: Lens' CreateEventSubscriptionResponse (Maybe EventSubscription)
cesrEventSubscription = lens _cesrEventSubscription (\ s a -> s{_cesrEventSubscription = a});

-- | FIXME: Undocumented member.
cesrStatus :: Lens' CreateEventSubscriptionResponse Int
cesrStatus = lens _cesrStatus (\ s a -> s{_cesrStatus = a});
