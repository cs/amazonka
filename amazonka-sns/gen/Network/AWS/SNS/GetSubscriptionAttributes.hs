{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric      #-}
{-# LANGUAGE OverloadedStrings  #-}
{-# LANGUAGE RecordWildCards    #-}
{-# LANGUAGE TypeFamilies       #-}

-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- |
-- Module      : Network.AWS.SNS.GetSubscriptionAttributes
-- Copyright   : (c) 2013-2015 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)
--
-- | Returns all of the properties of a subscription.
--
-- <http://docs.aws.amazon.com/sns/latest/api/API_GetSubscriptionAttributes.html>
module Network.AWS.SNS.GetSubscriptionAttributes
    (
    -- * Request
      GetSubscriptionAttributes
    -- ** Request constructor
    , getSubscriptionAttributes
    -- ** Request lenses
    , gsaSubscriptionARN

    -- * Response
    , GetSubscriptionAttributesResponse
    -- ** Response constructor
    , getSubscriptionAttributesResponse
    -- ** Response lenses
    , gsarAttributes
    , gsarStatus
    ) where

import           Network.AWS.Prelude
import           Network.AWS.Request
import           Network.AWS.Response
import           Network.AWS.SNS.Types

-- | Input for GetSubscriptionAttributes.
--
-- /See:/ 'getSubscriptionAttributes' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'gsaSubscriptionARN'
newtype GetSubscriptionAttributes = GetSubscriptionAttributes'
    { _gsaSubscriptionARN :: Text
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | 'GetSubscriptionAttributes' smart constructor.
getSubscriptionAttributes :: Text -> GetSubscriptionAttributes
getSubscriptionAttributes pSubscriptionARN =
    GetSubscriptionAttributes'
    { _gsaSubscriptionARN = pSubscriptionARN
    }

-- | The ARN of the subscription whose properties you want to get.
gsaSubscriptionARN :: Lens' GetSubscriptionAttributes Text
gsaSubscriptionARN = lens _gsaSubscriptionARN (\ s a -> s{_gsaSubscriptionARN = a});

instance AWSRequest GetSubscriptionAttributes where
        type Sv GetSubscriptionAttributes = SNS
        type Rs GetSubscriptionAttributes =
             GetSubscriptionAttributesResponse
        request = post
        response
          = receiveXMLWrapper "GetSubscriptionAttributesResult"
              (\ s h x ->
                 GetSubscriptionAttributesResponse' <$>
                   (x .@? "Attributes" .!@ mempty >>=
                      may (parseXMLMap "entry" "key" "value"))
                     <*> (pure (fromEnum s)))

instance ToHeaders GetSubscriptionAttributes where
        toHeaders = const mempty

instance ToPath GetSubscriptionAttributes where
        toPath = const "/"

instance ToQuery GetSubscriptionAttributes where
        toQuery GetSubscriptionAttributes'{..}
          = mconcat
              ["Action" =:
                 ("GetSubscriptionAttributes" :: ByteString),
               "Version" =: ("2010-03-31" :: ByteString),
               "SubscriptionArn" =: _gsaSubscriptionARN]

-- | Response for GetSubscriptionAttributes action.
--
-- /See:/ 'getSubscriptionAttributesResponse' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'gsarAttributes'
--
-- * 'gsarStatus'
data GetSubscriptionAttributesResponse = GetSubscriptionAttributesResponse'
    { _gsarAttributes :: !(Maybe (Map Text Text))
    , _gsarStatus     :: !Int
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | 'GetSubscriptionAttributesResponse' smart constructor.
getSubscriptionAttributesResponse :: Int -> GetSubscriptionAttributesResponse
getSubscriptionAttributesResponse pStatus =
    GetSubscriptionAttributesResponse'
    { _gsarAttributes = Nothing
    , _gsarStatus = pStatus
    }

-- | A map of the subscription\'s attributes. Attributes in this map include
-- the following:
--
-- -   @SubscriptionArn@ -- the subscription\'s ARN
-- -   @TopicArn@ -- the topic ARN that the subscription is associated with
-- -   @Owner@ -- the AWS account ID of the subscription\'s owner
-- -   @ConfirmationWasAuthenticated@ -- true if the subscription
--     confirmation request was authenticated
-- -   @DeliveryPolicy@ -- the JSON serialization of the subscription\'s
--     delivery policy
-- -   @EffectiveDeliveryPolicy@ -- the JSON serialization of the effective
--     delivery policy that takes into account the topic delivery policy
--     and account system defaults
gsarAttributes :: Lens' GetSubscriptionAttributesResponse (HashMap Text Text)
gsarAttributes = lens _gsarAttributes (\ s a -> s{_gsarAttributes = a}) . _Default . _Map;

-- | FIXME: Undocumented member.
gsarStatus :: Lens' GetSubscriptionAttributesResponse Int
gsarStatus = lens _gsarStatus (\ s a -> s{_gsarStatus = a});
