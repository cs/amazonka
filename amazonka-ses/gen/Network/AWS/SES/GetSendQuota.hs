{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric      #-}
{-# LANGUAGE OverloadedStrings  #-}
{-# LANGUAGE RecordWildCards    #-}
{-# LANGUAGE TypeFamilies       #-}

-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- |
-- Module      : Network.AWS.SES.GetSendQuota
-- Copyright   : (c) 2013-2015 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)
--
-- | Returns the user\'s current sending limits.
--
-- This action is throttled at one request per second.
--
-- <http://docs.aws.amazon.com/ses/latest/APIReference/API_GetSendQuota.html>
module Network.AWS.SES.GetSendQuota
    (
    -- * Request
      GetSendQuota
    -- ** Request constructor
    , getSendQuota

    -- * Response
    , GetSendQuotaResponse
    -- ** Response constructor
    , getSendQuotaResponse
    -- ** Response lenses
    , gsqrMaxSendRate
    , gsqrSentLast24Hours
    , gsqrMax24HourSend
    , gsqrStatus
    ) where

import           Network.AWS.Prelude
import           Network.AWS.Request
import           Network.AWS.Response
import           Network.AWS.SES.Types

-- | /See:/ 'getSendQuota' smart constructor.
data GetSendQuota =
    GetSendQuota'
    deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | 'GetSendQuota' smart constructor.
getSendQuota :: GetSendQuota
getSendQuota = GetSendQuota'

instance AWSRequest GetSendQuota where
        type Sv GetSendQuota = SES
        type Rs GetSendQuota = GetSendQuotaResponse
        request = post
        response
          = receiveXMLWrapper "GetSendQuotaResult"
              (\ s h x ->
                 GetSendQuotaResponse' <$>
                   (x .@? "MaxSendRate") <*> (x .@? "SentLast24Hours")
                     <*> (x .@? "Max24HourSend")
                     <*> (pure (fromEnum s)))

instance ToHeaders GetSendQuota where
        toHeaders = const mempty

instance ToPath GetSendQuota where
        toPath = const "/"

instance ToQuery GetSendQuota where
        toQuery
          = const
              (mconcat
                 ["Action" =: ("GetSendQuota" :: ByteString),
                  "Version" =: ("2010-12-01" :: ByteString)])

-- | Represents the user\'s current activity limits returned from a
-- successful @GetSendQuota@ request.
--
-- /See:/ 'getSendQuotaResponse' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'gsqrMaxSendRate'
--
-- * 'gsqrSentLast24Hours'
--
-- * 'gsqrMax24HourSend'
--
-- * 'gsqrStatus'
data GetSendQuotaResponse = GetSendQuotaResponse'
    { _gsqrMaxSendRate     :: !(Maybe Double)
    , _gsqrSentLast24Hours :: !(Maybe Double)
    , _gsqrMax24HourSend   :: !(Maybe Double)
    , _gsqrStatus          :: !Int
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | 'GetSendQuotaResponse' smart constructor.
getSendQuotaResponse :: Int -> GetSendQuotaResponse
getSendQuotaResponse pStatus =
    GetSendQuotaResponse'
    { _gsqrMaxSendRate = Nothing
    , _gsqrSentLast24Hours = Nothing
    , _gsqrMax24HourSend = Nothing
    , _gsqrStatus = pStatus
    }

-- | The maximum number of emails that Amazon SES can accept from the user\'s
-- account per second.
--
-- The rate at which Amazon SES accepts the user\'s messages might be less
-- than the maximum send rate.
gsqrMaxSendRate :: Lens' GetSendQuotaResponse (Maybe Double)
gsqrMaxSendRate = lens _gsqrMaxSendRate (\ s a -> s{_gsqrMaxSendRate = a});

-- | The number of emails sent during the previous 24 hours.
gsqrSentLast24Hours :: Lens' GetSendQuotaResponse (Maybe Double)
gsqrSentLast24Hours = lens _gsqrSentLast24Hours (\ s a -> s{_gsqrSentLast24Hours = a});

-- | The maximum number of emails the user is allowed to send in a 24-hour
-- interval. A value of -1 signifies an unlimited quota.
gsqrMax24HourSend :: Lens' GetSendQuotaResponse (Maybe Double)
gsqrMax24HourSend = lens _gsqrMax24HourSend (\ s a -> s{_gsqrMax24HourSend = a});

-- | FIXME: Undocumented member.
gsqrStatus :: Lens' GetSendQuotaResponse Int
gsqrStatus = lens _gsqrStatus (\ s a -> s{_gsqrStatus = a});
