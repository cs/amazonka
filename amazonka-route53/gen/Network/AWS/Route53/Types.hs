{-# LANGUAGE DeriveDataTypeable          #-}
{-# LANGUAGE DeriveGeneric               #-}
{-# LANGUAGE FlexibleInstances           #-}
{-# LANGUAGE GeneralizedNewtypeDeriving  #-}
{-# LANGUAGE LambdaCase                  #-}
{-# LANGUAGE NoImplicitPrelude           #-}
{-# LANGUAGE OverloadedStrings           #-}
{-# LANGUAGE TypeFamilies                #-}

-- {-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Module      : Network.AWS.Route53.Types
-- Copyright   : (c) 2013-2014 Brendan Hay <brendan.g.hay@gmail.com>
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)

module Network.AWS.Route53.Types
    (
    -- * Service
      Route53
    -- ** Errors
    , Route53Error (..)
    , _Route53Http
    , _Route53Serializer
    , _Route53Service
    -- ** XML
    , xmlOptions

    -- * AliasTarget
    , AliasTarget
    , aliasTarget
    , atDNSName
    , atEvaluateTargetHealth
    , atHostedZoneId

    -- * ResourceRecord
    , ResourceRecord
    , resourceRecord
    , rrValue

    -- * Tag
    , Tag
    , tag
    , tagKey
    , tagValue

    -- * GeoLocationDetails
    , GeoLocationDetails
    , geoLocationDetails
    , gldContinentCode
    , gldContinentName
    , gldCountryCode
    , gldCountryName
    , gldSubdivisionCode
    , gldSubdivisionName

    -- * HealthCheck
    , HealthCheck
    , healthCheck
    , hcCallerReference
    , hcHealthCheckConfig
    , hcHealthCheckVersion
    , hcId

    -- * VPCRegion
    , VPCRegion (..)

    -- * ChangeAction
    , ChangeAction (..)

    -- * TagResourceType
    , TagResourceType (..)

    -- * HealthCheckConfig
    , HealthCheckConfig
    , healthCheckConfig
    , hccFailureThreshold
    , hccFullyQualifiedDomainName
    , hccIPAddress
    , hccPort
    , hccRequestInterval
    , hccResourcePath
    , hccSearchString
    , hccType

    -- * Change
    , Change
    , change
    , cAction
    , cResourceRecordSet

    -- * ResourceRecordSetFailover
    , ResourceRecordSetFailover (..)

    -- * HostedZone
    , HostedZone
    , hostedZone
    , hzCallerReference
    , hzConfig
    , hzId
    , hzName
    , hzResourceRecordSetCount

    -- * ResourceTagSet
    , ResourceTagSet
    , resourceTagSet
    , rtsResourceId
    , rtsResourceType
    , rtsTags

    -- * ChangeStatus
    , ChangeStatus (..)

    -- * ChangeBatch
    , ChangeBatch
    , changeBatch
    , cbChanges
    , cbComment

    -- * StatusReport
    , StatusReport
    , statusReport
    , srCheckedTime
    , srStatus

    -- * HealthCheckType
    , HealthCheckType (..)

    -- * VPC
    , VPC
    , vpc
    , vpcVPCId
    , vpcVPCRegion

    -- * HostedZoneConfig
    , HostedZoneConfig
    , hostedZoneConfig
    , hzcComment
    , hzcPrivateZone

    -- * ResourceRecordSet
    , ResourceRecordSet
    , resourceRecordSet
    , rrsAliasTarget
    , rrsFailover
    , rrsGeoLocation
    , rrsHealthCheckId
    , rrsName
    , rrsRegion
    , rrsResourceRecords
    , rrsSetIdentifier
    , rrsTTL
    , rrsType
    , rrsWeight

    -- * DelegationSet
    , DelegationSet
    , delegationSet
    , dsCallerReference
    , dsId
    , dsNameServers

    -- * ChangeInfo
    , ChangeInfo
    , changeInfo
    , ciComment
    , ciId
    , ciStatus
    , ciSubmittedAt

    -- * GeoLocation
    , GeoLocation
    , geoLocation
    , glContinentCode
    , glCountryCode
    , glSubdivisionCode

    -- * HealthCheckObservation
    , HealthCheckObservation
    , healthCheckObservation
    , hcoIPAddress
    , hcoStatusReport
    ) where

import Network.AWS.Prelude
import Network.AWS.Signing.V3

-- | Supported version (@2013-04-01@) of the Amazon Route 53.
data Route53 deriving (Typeable)

instance AWSService Route53 where
    type Sg Route53 = V3
    type Er Route53 = Route53Error

    service = Service
        { _svcEndpoint = Global
        , _svcAbbrev   = "Route53"
        , _svcPrefix   = "route53"
        , _svcVersion  = "2013-04-01"
        , _svcTarget   = Nothing
        }

    handle = xmlError alwaysFail

xmlOptions :: Tagged a XMLOptions
xmlOptions = Tagged def

data AliasTarget = AliasTarget
    { _atDNSName              :: Text
    , _atEvaluateTargetHealth :: Bool
    , _atHostedZoneId         :: Text
    } deriving (Eq, Ord, Show, Generic)

-- | 'AliasTarget' constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'atDNSName' @::@ 'Text'
--
-- * 'atEvaluateTargetHealth' @::@ 'Bool'
--
-- * 'atHostedZoneId' @::@ 'Text'
--
aliasTarget :: Text -- ^ 'atHostedZoneId'
            -> Text -- ^ 'atDNSName'
            -> Bool -- ^ 'atEvaluateTargetHealth'
            -> AliasTarget
aliasTarget p1 p2 p3 = AliasTarget
    { _atHostedZoneId         = p1
    , _atDNSName              = p2
    , _atEvaluateTargetHealth = p3
    }

-- | Alias resource record sets only: The external DNS name associated with
-- the AWS Resource. For more information and an example, see Creating Alias
-- Resource Record Sets in the Amazon Route 53 Developer Guide.
atDNSName :: Lens' AliasTarget Text
atDNSName = lens _atDNSName (\s a -> s { _atDNSName = a })

-- | Alias resource record sets only: A boolean value that indicates whether
-- this Resource Record Set should respect the health status of any health
-- checks associated with the ALIAS target record which it is linked to. For
-- more information and an example, see Creating Alias Resource Record Sets
-- in the Amazon Route 53 Developer Guide.
atEvaluateTargetHealth :: Lens' AliasTarget Bool
atEvaluateTargetHealth =
    lens _atEvaluateTargetHealth (\s a -> s { _atEvaluateTargetHealth = a })

-- | Alias resource record sets only: The value of the hosted zone ID for the
-- AWS resource. For more information and an example, see Creating Alias
-- Resource Record Sets in the Amazon Route 53 Developer Guide.
atHostedZoneId :: Lens' AliasTarget Text
atHostedZoneId = lens _atHostedZoneId (\s a -> s { _atHostedZoneId = a })

instance FromXML AliasTarget where
    fromXMLOptions = xmlOptions
    fromXMLRoot    = fromRoot "AliasTarget"

instance ToXML AliasTarget where
    toXMLOptions = xmlOptions
    toXMLRoot    = toRoot "AliasTarget"

newtype ResourceRecord = ResourceRecord
    { _rrValue :: Text
    } deriving (Eq, Ord, Show, Generic, Monoid)

-- | 'ResourceRecord' constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'rrValue' @::@ 'Text'
--
resourceRecord :: Text -- ^ 'rrValue'
               -> ResourceRecord
resourceRecord p1 = ResourceRecord
    { _rrValue = p1
    }

-- | The value of the Value element for the current resource record set.
rrValue :: Lens' ResourceRecord Text
rrValue = lens _rrValue (\s a -> s { _rrValue = a })

instance FromXML ResourceRecord where
    fromXMLOptions = xmlOptions
    fromXMLRoot    = fromRoot "ResourceRecord"

instance ToXML ResourceRecord where
    toXMLOptions = xmlOptions
    toXMLRoot    = toRoot "ResourceRecord"

data Tag = Tag
    { _tagKey   :: Maybe Text
    , _tagValue :: Maybe Text
    } deriving (Eq, Ord, Show, Generic)

-- | 'Tag' constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'tagKey' @::@ 'Maybe' 'Text'
--
-- * 'tagValue' @::@ 'Maybe' 'Text'
--
tag :: Tag
tag = Tag
    { _tagKey   = Nothing
    , _tagValue = Nothing
    }

-- | The key for a Tag.
tagKey :: Lens' Tag (Maybe Text)
tagKey = lens _tagKey (\s a -> s { _tagKey = a })

-- | The value for a Tag.
tagValue :: Lens' Tag (Maybe Text)
tagValue = lens _tagValue (\s a -> s { _tagValue = a })

instance FromXML Tag where
    fromXMLOptions = xmlOptions
    fromXMLRoot    = fromRoot "Tag"

instance ToXML Tag where
    toXMLOptions = xmlOptions
    toXMLRoot    = toRoot "Tag"

data GeoLocationDetails = GeoLocationDetails
    { _gldContinentCode   :: Maybe Text
    , _gldContinentName   :: Maybe Text
    , _gldCountryCode     :: Maybe Text
    , _gldCountryName     :: Maybe Text
    , _gldSubdivisionCode :: Maybe Text
    , _gldSubdivisionName :: Maybe Text
    } deriving (Eq, Ord, Show, Generic)

-- | 'GeoLocationDetails' constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'gldContinentCode' @::@ 'Maybe' 'Text'
--
-- * 'gldContinentName' @::@ 'Maybe' 'Text'
--
-- * 'gldCountryCode' @::@ 'Maybe' 'Text'
--
-- * 'gldCountryName' @::@ 'Maybe' 'Text'
--
-- * 'gldSubdivisionCode' @::@ 'Maybe' 'Text'
--
-- * 'gldSubdivisionName' @::@ 'Maybe' 'Text'
--
geoLocationDetails :: GeoLocationDetails
geoLocationDetails = GeoLocationDetails
    { _gldContinentCode   = Nothing
    , _gldContinentName   = Nothing
    , _gldCountryCode     = Nothing
    , _gldCountryName     = Nothing
    , _gldSubdivisionCode = Nothing
    , _gldSubdivisionName = Nothing
    }

-- | The code for a continent geo location. Note: only continent locations
-- have a continent code.
gldContinentCode :: Lens' GeoLocationDetails (Maybe Text)
gldContinentCode = lens _gldContinentCode (\s a -> s { _gldContinentCode = a })

-- | The name of the continent. This element is only present if ContinentCode
-- is also present.
gldContinentName :: Lens' GeoLocationDetails (Maybe Text)
gldContinentName = lens _gldContinentName (\s a -> s { _gldContinentName = a })

-- | The code for a country geo location. The default location uses '*' for
-- the country code and will match all locations that are not matched by a
-- geo location. The default geo location uses a * for the country code. All
-- other country codes follow the ISO 3166 two-character code.
gldCountryCode :: Lens' GeoLocationDetails (Maybe Text)
gldCountryCode = lens _gldCountryCode (\s a -> s { _gldCountryCode = a })

-- | The name of the country. This element is only present if CountryCode is
-- also present.
gldCountryName :: Lens' GeoLocationDetails (Maybe Text)
gldCountryName = lens _gldCountryName (\s a -> s { _gldCountryName = a })

-- | The code for a country's subdivision (e.g., a province of Canada). A
-- subdivision code is only valid with the appropriate country code.
gldSubdivisionCode :: Lens' GeoLocationDetails (Maybe Text)
gldSubdivisionCode =
    lens _gldSubdivisionCode (\s a -> s { _gldSubdivisionCode = a })

-- | The name of the subdivision. This element is only present if
-- SubdivisionCode is also present.
gldSubdivisionName :: Lens' GeoLocationDetails (Maybe Text)
gldSubdivisionName =
    lens _gldSubdivisionName (\s a -> s { _gldSubdivisionName = a })

instance FromXML GeoLocationDetails where
    fromXMLOptions = xmlOptions
    fromXMLRoot    = fromRoot "GeoLocationDetails"

instance ToXML GeoLocationDetails where
    toXMLOptions = xmlOptions
    toXMLRoot    = toRoot "GeoLocationDetails"

data HealthCheck = HealthCheck
    { _hcCallerReference    :: Text
    , _hcHealthCheckConfig  :: HealthCheckConfig
    , _hcHealthCheckVersion :: Integer
    , _hcId                 :: Text
    } deriving (Eq, Show, Generic)

-- | 'HealthCheck' constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'hcCallerReference' @::@ 'Text'
--
-- * 'hcHealthCheckConfig' @::@ 'HealthCheckConfig'
--
-- * 'hcHealthCheckVersion' @::@ 'Integer'
--
-- * 'hcId' @::@ 'Text'
--
healthCheck :: Text -- ^ 'hcId'
            -> Text -- ^ 'hcCallerReference'
            -> HealthCheckConfig -- ^ 'hcHealthCheckConfig'
            -> Integer -- ^ 'hcHealthCheckVersion'
            -> HealthCheck
healthCheck p1 p2 p3 p4 = HealthCheck
    { _hcId                 = p1
    , _hcCallerReference    = p2
    , _hcHealthCheckConfig  = p3
    , _hcHealthCheckVersion = p4
    }

-- | A unique string that identifies the request to create the health check.
hcCallerReference :: Lens' HealthCheck Text
hcCallerReference =
    lens _hcCallerReference (\s a -> s { _hcCallerReference = a })

-- | A complex type that contains the health check configuration.
hcHealthCheckConfig :: Lens' HealthCheck HealthCheckConfig
hcHealthCheckConfig =
    lens _hcHealthCheckConfig (\s a -> s { _hcHealthCheckConfig = a })

-- | The version of the health check. You can optionally pass this value in a
-- call to UpdateHealthCheck to prevent overwriting another change to the
-- health check.
hcHealthCheckVersion :: Lens' HealthCheck Integer
hcHealthCheckVersion =
    lens _hcHealthCheckVersion (\s a -> s { _hcHealthCheckVersion = a })

-- | The ID of the specified health check.
hcId :: Lens' HealthCheck Text
hcId = lens _hcId (\s a -> s { _hcId = a })

instance FromXML HealthCheck where
    fromXMLOptions = xmlOptions
    fromXMLRoot    = fromRoot "HealthCheck"

instance ToXML HealthCheck where
    toXMLOptions = xmlOptions
    toXMLRoot    = toRoot "HealthCheck"

data VPCRegion
    = ApNortheast1 -- ^ ap-northeast-1
    | ApSoutheast1 -- ^ ap-southeast-1
    | ApSoutheast2 -- ^ ap-southeast-2
    | CnNorth1     -- ^ cn-north-1
    | EuCentral1   -- ^ eu-central-1
    | EuWest1      -- ^ eu-west-1
    | SaEast1      -- ^ sa-east-1
    | UsEast1      -- ^ us-east-1
    | UsWest1      -- ^ us-west-1
    | UsWest2      -- ^ us-west-2
      deriving (Eq, Ord, Enum, Show, Generic)

instance Hashable VPCRegion

instance FromText VPCRegion where
    parser = match "ap-northeast-1" ApNortheast1
         <|> match "ap-southeast-1" ApSoutheast1
         <|> match "ap-southeast-2" ApSoutheast2
         <|> match "cn-north-1"     CnNorth1
         <|> match "eu-central-1"   EuCentral1
         <|> match "eu-west-1"      EuWest1
         <|> match "sa-east-1"      SaEast1
         <|> match "us-east-1"      UsEast1
         <|> match "us-west-1"      UsWest1
         <|> match "us-west-2"      UsWest2

instance ToText VPCRegion where
    toText = \case
        ApNortheast1 -> "ap-northeast-1"
        ApSoutheast1 -> "ap-southeast-1"
        ApSoutheast2 -> "ap-southeast-2"
        CnNorth1     -> "cn-north-1"
        EuCentral1   -> "eu-central-1"
        EuWest1      -> "eu-west-1"
        SaEast1      -> "sa-east-1"
        UsEast1      -> "us-east-1"
        UsWest1      -> "us-west-1"
        UsWest2      -> "us-west-2"

instance FromXML VPCRegion where
    fromXMLOptions = xmlOptions
    fromXMLRoot    = fromRoot "VPCRegion"

instance ToXML VPCRegion where
    toXMLOptions = xmlOptions
    toXMLRoot    = toRoot "VPCRegion"

data ChangeAction
    = Create -- ^ CREATE
    | Delete -- ^ DELETE
    | Upsert -- ^ UPSERT
      deriving (Eq, Ord, Enum, Show, Generic)

instance Hashable ChangeAction

instance FromText ChangeAction where
    parser = match "CREATE" Create
         <|> match "DELETE" Delete
         <|> match "UPSERT" Upsert

instance ToText ChangeAction where
    toText = \case
        Create -> "CREATE"
        Delete -> "DELETE"
        Upsert -> "UPSERT"

instance FromXML ChangeAction where
    fromXMLOptions = xmlOptions
    fromXMLRoot    = fromRoot "ChangeAction"

instance ToXML ChangeAction where
    toXMLOptions = xmlOptions
    toXMLRoot    = toRoot "ChangeAction"

data TagResourceType
    = Healthcheck -- ^ healthcheck
      deriving (Eq, Ord, Enum, Show, Generic)

instance Hashable TagResourceType

instance FromText TagResourceType where
    parser = match "healthcheck" Healthcheck

instance ToText TagResourceType where
    toText Healthcheck = "healthcheck"

instance FromXML TagResourceType where
    fromXMLOptions = xmlOptions
    fromXMLRoot    = fromRoot "TagResourceType"

instance ToXML TagResourceType where
    toXMLOptions = xmlOptions
    toXMLRoot    = toRoot "TagResourceType"

data HealthCheckConfig = HealthCheckConfig
    { _hccFailureThreshold         :: Maybe Int
    , _hccFullyQualifiedDomainName :: Maybe Text
    , _hccIPAddress                :: Maybe Text
    , _hccPort                     :: Maybe Int
    , _hccRequestInterval          :: Maybe Int
    , _hccResourcePath             :: Maybe Text
    , _hccSearchString             :: Maybe Text
    , _hccType                     :: Text
    } deriving (Eq, Ord, Show, Generic)

-- | 'HealthCheckConfig' constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'hccFailureThreshold' @::@ 'Maybe' 'Int'
--
-- * 'hccFullyQualifiedDomainName' @::@ 'Maybe' 'Text'
--
-- * 'hccIPAddress' @::@ 'Maybe' 'Text'
--
-- * 'hccPort' @::@ 'Maybe' 'Int'
--
-- * 'hccRequestInterval' @::@ 'Maybe' 'Int'
--
-- * 'hccResourcePath' @::@ 'Maybe' 'Text'
--
-- * 'hccSearchString' @::@ 'Maybe' 'Text'
--
-- * 'hccType' @::@ 'Text'
--
healthCheckConfig :: Text -- ^ 'hccType'
                  -> HealthCheckConfig
healthCheckConfig p1 = HealthCheckConfig
    { _hccType                     = p1
    , _hccIPAddress                = Nothing
    , _hccPort                     = Nothing
    , _hccResourcePath             = Nothing
    , _hccFullyQualifiedDomainName = Nothing
    , _hccSearchString             = Nothing
    , _hccRequestInterval          = Nothing
    , _hccFailureThreshold         = Nothing
    }

-- | The number of consecutive health checks that an endpoint must pass or
-- fail for Route 53 to change the current status of the endpoint from
-- unhealthy to healthy or vice versa. Valid values are integers between 1
-- and 10. For more information, see "How Amazon Route 53 Determines Whether
-- an Endpoint Is Healthy" in the Amazon Route 53 Developer Guide.
hccFailureThreshold :: Lens' HealthCheckConfig (Maybe Int)
hccFailureThreshold =
    lens _hccFailureThreshold (\s a -> s { _hccFailureThreshold = a })

-- | Fully qualified domain name of the instance to be health checked.
hccFullyQualifiedDomainName :: Lens' HealthCheckConfig (Maybe Text)
hccFullyQualifiedDomainName =
    lens _hccFullyQualifiedDomainName
        (\s a -> s { _hccFullyQualifiedDomainName = a })

-- | IP Address of the instance being checked.
hccIPAddress :: Lens' HealthCheckConfig (Maybe Text)
hccIPAddress = lens _hccIPAddress (\s a -> s { _hccIPAddress = a })

-- | Port on which connection will be opened to the instance to health check.
-- For HTTP and HTTP_STR_MATCH this defaults to 80 if the port is not
-- specified. For HTTPS and HTTPS_STR_MATCH this defaults to 443 if the port
-- is not specified.
hccPort :: Lens' HealthCheckConfig (Maybe Int)
hccPort = lens _hccPort (\s a -> s { _hccPort = a })

-- | The number of seconds between the time that Route 53 gets a response from
-- your endpoint and the time that it sends the next health-check request.
-- Each Route 53 health checker makes requests at this interval. Valid
-- values are 10 and 30. The default value is 30.
hccRequestInterval :: Lens' HealthCheckConfig (Maybe Int)
hccRequestInterval =
    lens _hccRequestInterval (\s a -> s { _hccRequestInterval = a })

-- | Path to ping on the instance to check the health. Required for HTTP,
-- HTTPS, HTTP_STR_MATCH, and HTTPS_STR_MATCH health checks, HTTP request is
-- issued to the instance on the given port and path.
hccResourcePath :: Lens' HealthCheckConfig (Maybe Text)
hccResourcePath = lens _hccResourcePath (\s a -> s { _hccResourcePath = a })

-- | A string to search for in the body of a health check response. Required
-- for HTTP_STR_MATCH and HTTPS_STR_MATCH health checks.
hccSearchString :: Lens' HealthCheckConfig (Maybe Text)
hccSearchString = lens _hccSearchString (\s a -> s { _hccSearchString = a })

-- | The type of health check to be performed. Currently supported types are
-- TCP, HTTP, HTTPS, HTTP_STR_MATCH, and HTTPS_STR_MATCH.
hccType :: Lens' HealthCheckConfig Text
hccType = lens _hccType (\s a -> s { _hccType = a })

instance FromXML HealthCheckConfig where
    fromXMLOptions = xmlOptions
    fromXMLRoot    = fromRoot "HealthCheckConfig"

instance ToXML HealthCheckConfig where
    toXMLOptions = xmlOptions
    toXMLRoot    = toRoot "HealthCheckConfig"

data Change = Change
    { _cAction            :: Text
    , _cResourceRecordSet :: ResourceRecordSet
    } deriving (Eq, Show, Generic)

-- | 'Change' constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'cAction' @::@ 'Text'
--
-- * 'cResourceRecordSet' @::@ 'ResourceRecordSet'
--
change :: Text -- ^ 'cAction'
       -> ResourceRecordSet -- ^ 'cResourceRecordSet'
       -> Change
change p1 p2 = Change
    { _cAction            = p1
    , _cResourceRecordSet = p2
    }

-- | The action to perform. Valid values: CREATE | DELETE | UPSERT.
cAction :: Lens' Change Text
cAction = lens _cAction (\s a -> s { _cAction = a })

-- | Information about the resource record set to create or delete.
cResourceRecordSet :: Lens' Change ResourceRecordSet
cResourceRecordSet =
    lens _cResourceRecordSet (\s a -> s { _cResourceRecordSet = a })

instance FromXML Change where
    fromXMLOptions = xmlOptions
    fromXMLRoot    = fromRoot "Change"

instance ToXML Change where
    toXMLOptions = xmlOptions
    toXMLRoot    = toRoot "Change"

data ResourceRecordSetFailover
    = Primary   -- ^ PRIMARY
    | Secondary -- ^ SECONDARY
      deriving (Eq, Ord, Enum, Show, Generic)

instance Hashable ResourceRecordSetFailover

instance FromText ResourceRecordSetFailover where
    parser = match "PRIMARY"   Primary
         <|> match "SECONDARY" Secondary

instance ToText ResourceRecordSetFailover where
    toText = \case
        Primary   -> "PRIMARY"
        Secondary -> "SECONDARY"

instance FromXML ResourceRecordSetFailover where
    fromXMLOptions = xmlOptions
    fromXMLRoot    = fromRoot "ResourceRecordSetFailover"

instance ToXML ResourceRecordSetFailover where
    toXMLOptions = xmlOptions
    toXMLRoot    = toRoot "ResourceRecordSetFailover"

data HostedZone = HostedZone
    { _hzCallerReference        :: Text
    , _hzConfig                 :: Maybe HostedZoneConfig
    , _hzId                     :: Text
    , _hzName                   :: Text
    , _hzResourceRecordSetCount :: Maybe Integer
    } deriving (Eq, Show, Generic)

-- | 'HostedZone' constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'hzCallerReference' @::@ 'Text'
--
-- * 'hzConfig' @::@ 'Maybe' 'HostedZoneConfig'
--
-- * 'hzId' @::@ 'Text'
--
-- * 'hzName' @::@ 'Text'
--
-- * 'hzResourceRecordSetCount' @::@ 'Maybe' 'Integer'
--
hostedZone :: Text -- ^ 'hzId'
           -> Text -- ^ 'hzName'
           -> Text -- ^ 'hzCallerReference'
           -> HostedZone
hostedZone p1 p2 p3 = HostedZone
    { _hzId                     = p1
    , _hzName                   = p2
    , _hzCallerReference        = p3
    , _hzConfig                 = Nothing
    , _hzResourceRecordSetCount = Nothing
    }

-- | A unique string that identifies the request to create the hosted zone.
hzCallerReference :: Lens' HostedZone Text
hzCallerReference =
    lens _hzCallerReference (\s a -> s { _hzCallerReference = a })

-- | A complex type that contains the Comment element.
hzConfig :: Lens' HostedZone (Maybe HostedZoneConfig)
hzConfig = lens _hzConfig (\s a -> s { _hzConfig = a })

-- | The ID of the specified hosted zone.
hzId :: Lens' HostedZone Text
hzId = lens _hzId (\s a -> s { _hzId = a })

-- | The name of the domain. This must be a fully-specified domain, for
-- example, www.example.com. The trailing dot is optional; Route 53 assumes
-- that the domain name is fully qualified. This means that Route 53 treats
-- www.example.com (without a trailing dot) and www.example.com. (with a
-- trailing dot) as identical. This is the name you have registered with
-- your DNS registrar. You should ask your registrar to change the
-- authoritative name servers for your domain to the set of NameServers
-- elements returned in DelegationSet.
hzName :: Lens' HostedZone Text
hzName = lens _hzName (\s a -> s { _hzName = a })

-- | Total number of resource record sets in the hosted zone.
hzResourceRecordSetCount :: Lens' HostedZone (Maybe Integer)
hzResourceRecordSetCount =
    lens _hzResourceRecordSetCount
        (\s a -> s { _hzResourceRecordSetCount = a })

instance FromXML HostedZone where
    fromXMLOptions = xmlOptions
    fromXMLRoot    = fromRoot "HostedZone"

instance ToXML HostedZone where
    toXMLOptions = xmlOptions
    toXMLRoot    = toRoot "HostedZone"

data ResourceTagSet = ResourceTagSet
    { _rtsResourceId   :: Maybe Text
    , _rtsResourceType :: Maybe Text
    , _rtsTags         :: List1 Tag
    } deriving (Eq, Show, Generic)

-- | 'ResourceTagSet' constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'rtsResourceId' @::@ 'Maybe' 'Text'
--
-- * 'rtsResourceType' @::@ 'Maybe' 'Text'
--
-- * 'rtsTags' @::@ 'NonEmpty' 'Tag'
--
resourceTagSet :: List1 Tag -- ^ 'rtsTags'
               -> ResourceTagSet
resourceTagSet p1 = ResourceTagSet
    { _rtsTags         = withIso _List1 (const id) p1
    , _rtsResourceType = Nothing
    , _rtsResourceId   = Nothing
    }

-- | The ID for the specified resource.
rtsResourceId :: Lens' ResourceTagSet (Maybe Text)
rtsResourceId = lens _rtsResourceId (\s a -> s { _rtsResourceId = a })

-- | The type of the resource. The resource type for health checks is
-- healthcheck.
rtsResourceType :: Lens' ResourceTagSet (Maybe Text)
rtsResourceType = lens _rtsResourceType (\s a -> s { _rtsResourceType = a })

-- | The tags associated with the specified resource.
rtsTags :: Lens' ResourceTagSet (NonEmpty Tag)
rtsTags = lens _rtsTags (\s a -> s { _rtsTags = a })
    . _List1

instance FromXML ResourceTagSet where
    fromXMLOptions = xmlOptions
    fromXMLRoot    = fromRoot "ResourceTagSet"

instance ToXML ResourceTagSet where
    toXMLOptions = xmlOptions
    toXMLRoot    = toRoot "ResourceTagSet"

data ChangeStatus
    = Insync  -- ^ INSYNC
    | Pending -- ^ PENDING
      deriving (Eq, Ord, Enum, Show, Generic)

instance Hashable ChangeStatus

instance FromText ChangeStatus where
    parser = match "INSYNC"  Insync
         <|> match "PENDING" Pending

instance ToText ChangeStatus where
    toText = \case
        Insync  -> "INSYNC"
        Pending -> "PENDING"

instance FromXML ChangeStatus where
    fromXMLOptions = xmlOptions
    fromXMLRoot    = fromRoot "ChangeStatus"

instance ToXML ChangeStatus where
    toXMLOptions = xmlOptions
    toXMLRoot    = toRoot "ChangeStatus"

data ChangeBatch = ChangeBatch
    { _cbChanges :: List1 Change
    , _cbComment :: Maybe Text
    } deriving (Eq, Show, Generic)

-- | 'ChangeBatch' constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'cbChanges' @::@ 'NonEmpty' 'Change'
--
-- * 'cbComment' @::@ 'Maybe' 'Text'
--
changeBatch :: List1 Change -- ^ 'cbChanges'
            -> ChangeBatch
changeBatch p1 = ChangeBatch
    { _cbChanges = withIso _List1 (const id) p1
    , _cbComment = Nothing
    }

-- | A complex type that contains one Change element for each resource record
-- set that you want to create or delete.
cbChanges :: Lens' ChangeBatch (NonEmpty Change)
cbChanges = lens _cbChanges (\s a -> s { _cbChanges = a })
    . _List1

-- | Optional: Any comments you want to include about a change batch request.
cbComment :: Lens' ChangeBatch (Maybe Text)
cbComment = lens _cbComment (\s a -> s { _cbComment = a })

instance FromXML ChangeBatch where
    fromXMLOptions = xmlOptions
    fromXMLRoot    = fromRoot "ChangeBatch"

instance ToXML ChangeBatch where
    toXMLOptions = xmlOptions
    toXMLRoot    = toRoot "ChangeBatch"

data StatusReport = StatusReport
    { _srCheckedTime :: Maybe RFC822
    , _srStatus      :: Maybe Text
    } deriving (Eq, Ord, Show, Generic)

-- | 'StatusReport' constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'srCheckedTime' @::@ 'Maybe' 'UTCTime'
--
-- * 'srStatus' @::@ 'Maybe' 'Text'
--
statusReport :: StatusReport
statusReport = StatusReport
    { _srStatus      = Nothing
    , _srCheckedTime = Nothing
    }

-- | The date and time the health check status was observed, in the format
-- YYYY-MM-DDThh:mm:ssZ, as specified in the ISO 8601 standard (for example,
-- 2009-11-19T19:37:58Z). The Z after the time indicates that the time is
-- listed in Coordinated Universal Time (UTC), which is synonymous with
-- Greenwich Mean Time in this context.
srCheckedTime :: Lens' StatusReport (Maybe UTCTime)
srCheckedTime = lens _srCheckedTime (\s a -> s { _srCheckedTime = a })
    . mapping _Time

-- | The observed health check status.
srStatus :: Lens' StatusReport (Maybe Text)
srStatus = lens _srStatus (\s a -> s { _srStatus = a })

instance FromXML StatusReport where
    fromXMLOptions = xmlOptions
    fromXMLRoot    = fromRoot "StatusReport"

instance ToXML StatusReport where
    toXMLOptions = xmlOptions
    toXMLRoot    = toRoot "StatusReport"

data HealthCheckType
    = Http          -- ^ HTTP
    | HttpStrMatch  -- ^ HTTP_STR_MATCH
    | Https         -- ^ HTTPS
    | HttpsStrMatch -- ^ HTTPS_STR_MATCH
    | Tcp           -- ^ TCP
      deriving (Eq, Ord, Enum, Show, Generic)

instance Hashable HealthCheckType

instance FromText HealthCheckType where
    parser = match "HTTP"            Http
         <|> match "HTTP_STR_MATCH"  HttpStrMatch
         <|> match "HTTPS"           Https
         <|> match "HTTPS_STR_MATCH" HttpsStrMatch
         <|> match "TCP"             Tcp

instance ToText HealthCheckType where
    toText = \case
        Http          -> "HTTP"
        HttpStrMatch  -> "HTTP_STR_MATCH"
        Https         -> "HTTPS"
        HttpsStrMatch -> "HTTPS_STR_MATCH"
        Tcp           -> "TCP"

instance FromXML HealthCheckType where
    fromXMLOptions = xmlOptions
    fromXMLRoot    = fromRoot "HealthCheckType"

instance ToXML HealthCheckType where
    toXMLOptions = xmlOptions
    toXMLRoot    = toRoot "HealthCheckType"

data VPC = VPC
    { _vpcVPCId     :: Maybe Text
    , _vpcVPCRegion :: Maybe Text
    } deriving (Eq, Ord, Show, Generic)

-- | 'VPC' constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'vpcVPCId' @::@ 'Maybe' 'Text'
--
-- * 'vpcVPCRegion' @::@ 'Maybe' 'Text'
--
vpc :: VPC
vpc = VPC
    { _vpcVPCRegion = Nothing
    , _vpcVPCId     = Nothing
    }

vpcVPCId :: Lens' VPC (Maybe Text)
vpcVPCId = lens _vpcVPCId (\s a -> s { _vpcVPCId = a })

vpcVPCRegion :: Lens' VPC (Maybe Text)
vpcVPCRegion = lens _vpcVPCRegion (\s a -> s { _vpcVPCRegion = a })

instance FromXML VPC where
    fromXMLOptions = xmlOptions
    fromXMLRoot    = fromRoot "VPC"

instance ToXML VPC where
    toXMLOptions = xmlOptions
    toXMLRoot    = toRoot "VPC"

data HostedZoneConfig = HostedZoneConfig
    { _hzcComment     :: Maybe Text
    , _hzcPrivateZone :: Maybe Bool
    } deriving (Eq, Ord, Show, Generic)

-- | 'HostedZoneConfig' constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'hzcComment' @::@ 'Maybe' 'Text'
--
-- * 'hzcPrivateZone' @::@ 'Maybe' 'Bool'
--
hostedZoneConfig :: HostedZoneConfig
hostedZoneConfig = HostedZoneConfig
    { _hzcComment     = Nothing
    , _hzcPrivateZone = Nothing
    }

-- | An optional comment about your hosted zone. If you don't want to specify
-- a comment, you can omit the HostedZoneConfig and Comment elements from
-- the XML document.
hzcComment :: Lens' HostedZoneConfig (Maybe Text)
hzcComment = lens _hzcComment (\s a -> s { _hzcComment = a })

hzcPrivateZone :: Lens' HostedZoneConfig (Maybe Bool)
hzcPrivateZone = lens _hzcPrivateZone (\s a -> s { _hzcPrivateZone = a })

instance FromXML HostedZoneConfig where
    fromXMLOptions = xmlOptions
    fromXMLRoot    = fromRoot "HostedZoneConfig"

instance ToXML HostedZoneConfig where
    toXMLOptions = xmlOptions
    toXMLRoot    = toRoot "HostedZoneConfig"

data ResourceRecordSet = ResourceRecordSet
    { _rrsAliasTarget     :: Maybe AliasTarget
    , _rrsFailover        :: Maybe Text
    , _rrsGeoLocation     :: Maybe GeoLocation
    , _rrsHealthCheckId   :: Maybe Text
    , _rrsName            :: Text
    , _rrsRegion          :: Maybe Text
    , _rrsResourceRecords :: List1 ResourceRecord
    , _rrsSetIdentifier   :: Maybe Text
    , _rrsTTL             :: Maybe Integer
    , _rrsType            :: Text
    , _rrsWeight          :: Maybe Integer
    } deriving (Eq, Show, Generic)

-- | 'ResourceRecordSet' constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'rrsAliasTarget' @::@ 'Maybe' 'AliasTarget'
--
-- * 'rrsFailover' @::@ 'Maybe' 'Text'
--
-- * 'rrsGeoLocation' @::@ 'Maybe' 'GeoLocation'
--
-- * 'rrsHealthCheckId' @::@ 'Maybe' 'Text'
--
-- * 'rrsName' @::@ 'Text'
--
-- * 'rrsRegion' @::@ 'Maybe' 'Text'
--
-- * 'rrsResourceRecords' @::@ 'NonEmpty' 'ResourceRecord'
--
-- * 'rrsSetIdentifier' @::@ 'Maybe' 'Text'
--
-- * 'rrsTTL' @::@ 'Maybe' 'Integer'
--
-- * 'rrsType' @::@ 'Text'
--
-- * 'rrsWeight' @::@ 'Maybe' 'Integer'
--
resourceRecordSet :: Text -- ^ 'rrsName'
                  -> Text -- ^ 'rrsType'
                  -> NonEmpty ResourceRecord -- ^ 'rrsResourceRecords'
                  -> ResourceRecordSet
resourceRecordSet p1 p2 p3 = ResourceRecordSet
    { _rrsName            = p1
    , _rrsType            = p2
    , _rrsResourceRecords = withIso _List1 (const id) p3
    , _rrsSetIdentifier   = Nothing
    , _rrsWeight          = Nothing
    , _rrsRegion          = Nothing
    , _rrsGeoLocation     = Nothing
    , _rrsFailover        = Nothing
    , _rrsTTL             = Nothing
    , _rrsAliasTarget     = Nothing
    , _rrsHealthCheckId   = Nothing
    }

-- | Alias resource record sets only: Information about the AWS resource to
-- which you are redirecting traffic.
rrsAliasTarget :: Lens' ResourceRecordSet (Maybe AliasTarget)
rrsAliasTarget = lens _rrsAliasTarget (\s a -> s { _rrsAliasTarget = a })

-- | Failover resource record sets only: Among resource record sets that have
-- the same combination of DNS name and type, a value that indicates whether
-- the current resource record set is a primary or secondary resource record
-- set. A failover set may contain at most one resource record set marked as
-- primary and one resource record set marked as secondary. A resource
-- record set marked as primary will be returned if any of the following are
-- true: (1) an associated health check is passing, (2) if the resource
-- record set is an alias with the evaluate target health and at least one
-- target resource record set is healthy, (3) both the primary and secondary
-- resource record set are failing health checks or (4) there is no
-- secondary resource record set. A secondary resource record set will be
-- returned if: (1) the primary is failing a health check and either the
-- secondary is passing a health check or has no associated health check, or
-- (2) there is no primary resource record set. Valid values: PRIMARY |
-- SECONDARY.
rrsFailover :: Lens' ResourceRecordSet (Maybe Text)
rrsFailover = lens _rrsFailover (\s a -> s { _rrsFailover = a })

-- | Geo location resource record sets only: Among resource record sets that
-- have the same combination of DNS name and type, a value that specifies
-- the geo location for the current resource record set.
rrsGeoLocation :: Lens' ResourceRecordSet (Maybe GeoLocation)
rrsGeoLocation = lens _rrsGeoLocation (\s a -> s { _rrsGeoLocation = a })

-- | Health Check resource record sets only, not required for alias resource
-- record sets: An identifier that is used to identify health check
-- associated with the resource record set.
rrsHealthCheckId :: Lens' ResourceRecordSet (Maybe Text)
rrsHealthCheckId = lens _rrsHealthCheckId (\s a -> s { _rrsHealthCheckId = a })

-- | The domain name of the current resource record set.
rrsName :: Lens' ResourceRecordSet Text
rrsName = lens _rrsName (\s a -> s { _rrsName = a })

-- | Latency-based resource record sets only: Among resource record sets that
-- have the same combination of DNS name and type, a value that specifies
-- the AWS region for the current resource record set.
rrsRegion :: Lens' ResourceRecordSet (Maybe Text)
rrsRegion = lens _rrsRegion (\s a -> s { _rrsRegion = a })

-- | A complex type that contains the resource records for the current
-- resource record set.
rrsResourceRecords :: Lens' ResourceRecordSet (NonEmpty ResourceRecord)
rrsResourceRecords =
    lens _rrsResourceRecords (\s a -> s { _rrsResourceRecords = a })
        . _List1

-- | Weighted, Latency, Geo, and Failover resource record sets only: An
-- identifier that differentiates among multiple resource record sets that
-- have the same combination of DNS name and type.
rrsSetIdentifier :: Lens' ResourceRecordSet (Maybe Text)
rrsSetIdentifier = lens _rrsSetIdentifier (\s a -> s { _rrsSetIdentifier = a })

-- | The cache time to live for the current resource record set.
rrsTTL :: Lens' ResourceRecordSet (Maybe Integer)
rrsTTL = lens _rrsTTL (\s a -> s { _rrsTTL = a })

-- | The type of the current resource record set.
rrsType :: Lens' ResourceRecordSet Text
rrsType = lens _rrsType (\s a -> s { _rrsType = a })

-- | Weighted resource record sets only: Among resource record sets that have
-- the same combination of DNS name and type, a value that determines what
-- portion of traffic for the current resource record set is routed to the
-- associated location.
rrsWeight :: Lens' ResourceRecordSet (Maybe Integer)
rrsWeight = lens _rrsWeight (\s a -> s { _rrsWeight = a })

instance FromXML ResourceRecordSet where
    fromXMLOptions = xmlOptions
    fromXMLRoot    = fromRoot "ResourceRecordSet"

instance ToXML ResourceRecordSet where
    toXMLOptions = xmlOptions
    toXMLRoot    = toRoot "ResourceRecordSet"

data DelegationSet = DelegationSet
    { _dsCallerReference :: Maybe Text
    , _dsId              :: Maybe Text
    , _dsNameServers     :: List1 Text
    } deriving (Eq, Ord, Show, Generic)

-- | 'DelegationSet' constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'dsCallerReference' @::@ 'Maybe' 'Text'
--
-- * 'dsId' @::@ 'Maybe' 'Text'
--
-- * 'dsNameServers' @::@ 'NonEmpty' 'Text'
--
delegationSet :: List1 Text -- ^ 'dsNameServers'
              -> DelegationSet
delegationSet p1 = DelegationSet
    { _dsNameServers     = withIso _List1 (const id) p1
    , _dsId              = Nothing
    , _dsCallerReference = Nothing
    }

dsCallerReference :: Lens' DelegationSet (Maybe Text)
dsCallerReference =
    lens _dsCallerReference (\s a -> s { _dsCallerReference = a })

dsId :: Lens' DelegationSet (Maybe Text)
dsId = lens _dsId (\s a -> s { _dsId = a })

-- | A complex type that contains the authoritative name servers for the
-- hosted zone. Use the method provided by your domain registrar to add an
-- NS record to your domain for each NameServer that is assigned to your
-- hosted zone.
dsNameServers :: Lens' DelegationSet (NonEmpty Text)
dsNameServers = lens _dsNameServers (\s a -> s { _dsNameServers = a })
    . _List1

instance FromXML DelegationSet where
    fromXMLOptions = xmlOptions
    fromXMLRoot    = fromRoot "DelegationSet"

instance ToXML DelegationSet where
    toXMLOptions = xmlOptions
    toXMLRoot    = toRoot "DelegationSet"

data ChangeInfo = ChangeInfo
    { _ciComment     :: Maybe Text
    , _ciId          :: Text
    , _ciStatus      :: Text
    , _ciSubmittedAt :: RFC822
    } deriving (Eq, Ord, Show, Generic)

-- | 'ChangeInfo' constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'ciComment' @::@ 'Maybe' 'Text'
--
-- * 'ciId' @::@ 'Text'
--
-- * 'ciStatus' @::@ 'Text'
--
-- * 'ciSubmittedAt' @::@ 'UTCTime'
--
changeInfo :: Text -- ^ 'ciId'
           -> Text -- ^ 'ciStatus'
           -> UTCTime -- ^ 'ciSubmittedAt'
           -> ChangeInfo
changeInfo p1 p2 p3 = ChangeInfo
    { _ciId          = p1
    , _ciStatus      = p2
    , _ciSubmittedAt = withIso _Time (const id) p3
    , _ciComment     = Nothing
    }

-- | A complex type that describes change information about changes made to
-- your hosted zone. This element contains an ID that you use when
-- performing a GetChange action to get detailed information about the
-- change.
ciComment :: Lens' ChangeInfo (Maybe Text)
ciComment = lens _ciComment (\s a -> s { _ciComment = a })

-- | The ID of the request. Use this ID to track when the change has completed
-- across all Amazon Route 53 DNS servers.
ciId :: Lens' ChangeInfo Text
ciId = lens _ciId (\s a -> s { _ciId = a })

-- | The current state of the request. PENDING indicates that this request has
-- not yet been applied to all Amazon Route 53 DNS servers. Valid Values:
-- PENDING | INSYNC.
ciStatus :: Lens' ChangeInfo Text
ciStatus = lens _ciStatus (\s a -> s { _ciStatus = a })

-- | The date and time the change was submitted, in the format
-- YYYY-MM-DDThh:mm:ssZ, as specified in the ISO 8601 standard (for example,
-- 2009-11-19T19:37:58Z). The Z after the time indicates that the time is
-- listed in Coordinated Universal Time (UTC), which is synonymous with
-- Greenwich Mean Time in this context.
ciSubmittedAt :: Lens' ChangeInfo UTCTime
ciSubmittedAt = lens _ciSubmittedAt (\s a -> s { _ciSubmittedAt = a })
    . _Time

instance FromXML ChangeInfo where
    fromXMLOptions = xmlOptions
    fromXMLRoot    = fromRoot "ChangeInfo"

instance ToXML ChangeInfo where
    toXMLOptions = xmlOptions
    toXMLRoot    = toRoot "ChangeInfo"

data GeoLocation = GeoLocation
    { _glContinentCode   :: Maybe Text
    , _glCountryCode     :: Maybe Text
    , _glSubdivisionCode :: Maybe Text
    } deriving (Eq, Ord, Show, Generic)

-- | 'GeoLocation' constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'glContinentCode' @::@ 'Maybe' 'Text'
--
-- * 'glCountryCode' @::@ 'Maybe' 'Text'
--
-- * 'glSubdivisionCode' @::@ 'Maybe' 'Text'
--
geoLocation :: GeoLocation
geoLocation = GeoLocation
    { _glContinentCode   = Nothing
    , _glCountryCode     = Nothing
    , _glSubdivisionCode = Nothing
    }

-- | The code for a continent geo location. Note: only continent locations
-- have a continent code. Valid values: AF | AN | AS | EU | OC | NA | SA
-- Constraint: Specifying ContinentCode with either CountryCode or
-- SubdivisionCode returns an InvalidInput error.
glContinentCode :: Lens' GeoLocation (Maybe Text)
glContinentCode = lens _glContinentCode (\s a -> s { _glContinentCode = a })

-- | The code for a country geo location. The default location uses '*' for
-- the country code and will match all locations that are not matched by a
-- geo location. The default geo location uses a * for the country code. All
-- other country codes follow the ISO 3166 two-character code.
glCountryCode :: Lens' GeoLocation (Maybe Text)
glCountryCode = lens _glCountryCode (\s a -> s { _glCountryCode = a })

-- | The code for a country's subdivision (e.g., a province of Canada). A
-- subdivision code is only valid with the appropriate country code.
-- Constraint: Specifying SubdivisionCode without CountryCode returns an
-- InvalidInput error.
glSubdivisionCode :: Lens' GeoLocation (Maybe Text)
glSubdivisionCode =
    lens _glSubdivisionCode (\s a -> s { _glSubdivisionCode = a })

instance FromXML GeoLocation where
    fromXMLOptions = xmlOptions
    fromXMLRoot    = fromRoot "GeoLocation"

instance ToXML GeoLocation where
    toXMLOptions = xmlOptions
    toXMLRoot    = toRoot "GeoLocation"

data HealthCheckObservation = HealthCheckObservation
    { _hcoIPAddress    :: Maybe Text
    , _hcoStatusReport :: Maybe StatusReport
    } deriving (Eq, Show, Generic)

-- | 'HealthCheckObservation' constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'hcoIPAddress' @::@ 'Maybe' 'Text'
--
-- * 'hcoStatusReport' @::@ 'Maybe' 'StatusReport'
--
healthCheckObservation :: HealthCheckObservation
healthCheckObservation = HealthCheckObservation
    { _hcoIPAddress    = Nothing
    , _hcoStatusReport = Nothing
    }

-- | The IP address of the Route 53 health checker that performed the health
-- check.
hcoIPAddress :: Lens' HealthCheckObservation (Maybe Text)
hcoIPAddress = lens _hcoIPAddress (\s a -> s { _hcoIPAddress = a })

-- | A complex type that contains information about the health check status
-- for the current observation.
hcoStatusReport :: Lens' HealthCheckObservation (Maybe StatusReport)
hcoStatusReport = lens _hcoStatusReport (\s a -> s { _hcoStatusReport = a })

instance FromXML HealthCheckObservation where
    fromXMLOptions = xmlOptions
    fromXMLRoot    = fromRoot "HealthCheckObservation"

instance ToXML HealthCheckObservation where
    toXMLOptions = xmlOptions
    toXMLRoot    = toRoot "HealthCheckObservation"
