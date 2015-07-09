{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric      #-}
{-# LANGUAGE OverloadedStrings  #-}
{-# LANGUAGE RecordWildCards    #-}
{-# LANGUAGE TypeFamilies       #-}

-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- |
-- Module      : Network.AWS.StorageGateway.DescribeBandwidthRateLimit
-- Copyright   : (c) 2013-2015 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)
--
-- | This operation returns the bandwidth rate limits of a gateway. By
-- default, these limits are not set, which means no bandwidth rate
-- limiting is in effect.
--
-- This operation only returns a value for a bandwidth rate limit only if
-- the limit is set. If no limits are set for the gateway, then this
-- operation returns only the gateway ARN in the response body. To specify
-- which gateway to describe, use the Amazon Resource Name (ARN) of the
-- gateway in your request.
--
-- <http://docs.aws.amazon.com/storagegateway/latest/APIReference/API_DescribeBandwidthRateLimit.html>
module Network.AWS.StorageGateway.DescribeBandwidthRateLimit
    (
    -- * Request
      DescribeBandwidthRateLimit
    -- ** Request constructor
    , describeBandwidthRateLimit
    -- ** Request lenses
    , dbrlGatewayARN

    -- * Response
    , DescribeBandwidthRateLimitResponse
    -- ** Response constructor
    , describeBandwidthRateLimitResponse
    -- ** Response lenses
    , dbrlrGatewayARN
    , dbrlrAverageUploadRateLimitInBitsPerSec
    , dbrlrAverageDownloadRateLimitInBitsPerSec
    , dbrlrStatus
    ) where

import           Network.AWS.Prelude
import           Network.AWS.Request
import           Network.AWS.Response
import           Network.AWS.StorageGateway.Types

-- | A JSON object containing the of the gateway.
--
-- /See:/ 'describeBandwidthRateLimit' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'dbrlGatewayARN'
newtype DescribeBandwidthRateLimit = DescribeBandwidthRateLimit'
    { _dbrlGatewayARN :: Text
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | 'DescribeBandwidthRateLimit' smart constructor.
describeBandwidthRateLimit :: Text -> DescribeBandwidthRateLimit
describeBandwidthRateLimit pGatewayARN =
    DescribeBandwidthRateLimit'
    { _dbrlGatewayARN = pGatewayARN
    }

-- | FIXME: Undocumented member.
dbrlGatewayARN :: Lens' DescribeBandwidthRateLimit Text
dbrlGatewayARN = lens _dbrlGatewayARN (\ s a -> s{_dbrlGatewayARN = a});

instance AWSRequest DescribeBandwidthRateLimit where
        type Sv DescribeBandwidthRateLimit = StorageGateway
        type Rs DescribeBandwidthRateLimit =
             DescribeBandwidthRateLimitResponse
        request = postJSON
        response
          = receiveJSON
              (\ s h x ->
                 DescribeBandwidthRateLimitResponse' <$>
                   (x .?> "GatewayARN") <*>
                     (x .?> "AverageUploadRateLimitInBitsPerSec")
                     <*> (x .?> "AverageDownloadRateLimitInBitsPerSec")
                     <*> (pure (fromEnum s)))

instance ToHeaders DescribeBandwidthRateLimit where
        toHeaders
          = const
              (mconcat
                 ["X-Amz-Target" =#
                    ("StorageGateway_20130630.DescribeBandwidthRateLimit"
                       :: ByteString),
                  "Content-Type" =#
                    ("application/x-amz-json-1.1" :: ByteString)])

instance ToJSON DescribeBandwidthRateLimit where
        toJSON DescribeBandwidthRateLimit'{..}
          = object ["GatewayARN" .= _dbrlGatewayARN]

instance ToPath DescribeBandwidthRateLimit where
        toPath = const "/"

instance ToQuery DescribeBandwidthRateLimit where
        toQuery = const mempty

-- | A JSON object containing the following fields:
--
-- /See:/ 'describeBandwidthRateLimitResponse' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'dbrlrGatewayARN'
--
-- * 'dbrlrAverageUploadRateLimitInBitsPerSec'
--
-- * 'dbrlrAverageDownloadRateLimitInBitsPerSec'
--
-- * 'dbrlrStatus'
data DescribeBandwidthRateLimitResponse = DescribeBandwidthRateLimitResponse'
    { _dbrlrGatewayARN                           :: !(Maybe Text)
    , _dbrlrAverageUploadRateLimitInBitsPerSec   :: !(Maybe Nat)
    , _dbrlrAverageDownloadRateLimitInBitsPerSec :: !(Maybe Nat)
    , _dbrlrStatus                               :: !Int
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | 'DescribeBandwidthRateLimitResponse' smart constructor.
describeBandwidthRateLimitResponse :: Int -> DescribeBandwidthRateLimitResponse
describeBandwidthRateLimitResponse pStatus =
    DescribeBandwidthRateLimitResponse'
    { _dbrlrGatewayARN = Nothing
    , _dbrlrAverageUploadRateLimitInBitsPerSec = Nothing
    , _dbrlrAverageDownloadRateLimitInBitsPerSec = Nothing
    , _dbrlrStatus = pStatus
    }

-- | FIXME: Undocumented member.
dbrlrGatewayARN :: Lens' DescribeBandwidthRateLimitResponse (Maybe Text)
dbrlrGatewayARN = lens _dbrlrGatewayARN (\ s a -> s{_dbrlrGatewayARN = a});

-- | The average upload bandwidth rate limit in bits per second. This field
-- does not appear in the response if the upload rate limit is not set.
dbrlrAverageUploadRateLimitInBitsPerSec :: Lens' DescribeBandwidthRateLimitResponse (Maybe Natural)
dbrlrAverageUploadRateLimitInBitsPerSec = lens _dbrlrAverageUploadRateLimitInBitsPerSec (\ s a -> s{_dbrlrAverageUploadRateLimitInBitsPerSec = a}) . mapping _Nat;

-- | The average download bandwidth rate limit in bits per second. This field
-- does not appear in the response if the download rate limit is not set.
dbrlrAverageDownloadRateLimitInBitsPerSec :: Lens' DescribeBandwidthRateLimitResponse (Maybe Natural)
dbrlrAverageDownloadRateLimitInBitsPerSec = lens _dbrlrAverageDownloadRateLimitInBitsPerSec (\ s a -> s{_dbrlrAverageDownloadRateLimitInBitsPerSec = a}) . mapping _Nat;

-- | FIXME: Undocumented member.
dbrlrStatus :: Lens' DescribeBandwidthRateLimitResponse Int
dbrlrStatus = lens _dbrlrStatus (\ s a -> s{_dbrlrStatus = a});
