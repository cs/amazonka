{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric      #-}
{-# LANGUAGE OverloadedStrings  #-}
{-# LANGUAGE RecordWildCards    #-}
{-# LANGUAGE TypeFamilies       #-}

-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- |
-- Module      : Network.AWS.StorageGateway.DeleteSnapshotSchedule
-- Copyright   : (c) 2013-2015 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)
--
-- | This operation deletes a snapshot of a volume.
--
-- You can take snapshots of your gateway volumes on a scheduled or ad-hoc
-- basis. This API enables you to delete a snapshot schedule for a volume.
-- For more information, see
-- <http://docs.aws.amazon.com/storagegateway/latest/userguide/WorkingWithSnapshots.html Working with Snapshots>.
-- In the @DeleteSnapshotSchedule@ request, you identify the volume by
-- providing its Amazon Resource Name (ARN).
--
-- To list or delete a snapshot, you must use the Amazon EC2 API. in
-- /Amazon Elastic Compute Cloud API Reference/.
--
-- <http://docs.aws.amazon.com/storagegateway/latest/APIReference/API_DeleteSnapshotSchedule.html>
module Network.AWS.StorageGateway.DeleteSnapshotSchedule
    (
    -- * Request
      DeleteSnapshotSchedule
    -- ** Request constructor
    , deleteSnapshotSchedule
    -- ** Request lenses
    , delVolumeARN

    -- * Response
    , DeleteSnapshotScheduleResponse
    -- ** Response constructor
    , deleteSnapshotScheduleResponse
    -- ** Response lenses
    , dssr1VolumeARN
    , dssr1Status
    ) where

import           Network.AWS.Prelude
import           Network.AWS.Request
import           Network.AWS.Response
import           Network.AWS.StorageGateway.Types

-- | /See:/ 'deleteSnapshotSchedule' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'delVolumeARN'
newtype DeleteSnapshotSchedule = DeleteSnapshotSchedule'
    { _delVolumeARN :: Text
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | 'DeleteSnapshotSchedule' smart constructor.
deleteSnapshotSchedule :: Text -> DeleteSnapshotSchedule
deleteSnapshotSchedule pVolumeARN =
    DeleteSnapshotSchedule'
    { _delVolumeARN = pVolumeARN
    }

-- | FIXME: Undocumented member.
delVolumeARN :: Lens' DeleteSnapshotSchedule Text
delVolumeARN = lens _delVolumeARN (\ s a -> s{_delVolumeARN = a});

instance AWSRequest DeleteSnapshotSchedule where
        type Sv DeleteSnapshotSchedule = StorageGateway
        type Rs DeleteSnapshotSchedule =
             DeleteSnapshotScheduleResponse
        request = postJSON
        response
          = receiveJSON
              (\ s h x ->
                 DeleteSnapshotScheduleResponse' <$>
                   (x .?> "VolumeARN") <*> (pure (fromEnum s)))

instance ToHeaders DeleteSnapshotSchedule where
        toHeaders
          = const
              (mconcat
                 ["X-Amz-Target" =#
                    ("StorageGateway_20130630.DeleteSnapshotSchedule" ::
                       ByteString),
                  "Content-Type" =#
                    ("application/x-amz-json-1.1" :: ByteString)])

instance ToJSON DeleteSnapshotSchedule where
        toJSON DeleteSnapshotSchedule'{..}
          = object ["VolumeARN" .= _delVolumeARN]

instance ToPath DeleteSnapshotSchedule where
        toPath = const "/"

instance ToQuery DeleteSnapshotSchedule where
        toQuery = const mempty

-- | /See:/ 'deleteSnapshotScheduleResponse' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'dssr1VolumeARN'
--
-- * 'dssr1Status'
data DeleteSnapshotScheduleResponse = DeleteSnapshotScheduleResponse'
    { _dssr1VolumeARN :: !(Maybe Text)
    , _dssr1Status    :: !Int
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | 'DeleteSnapshotScheduleResponse' smart constructor.
deleteSnapshotScheduleResponse :: Int -> DeleteSnapshotScheduleResponse
deleteSnapshotScheduleResponse pStatus =
    DeleteSnapshotScheduleResponse'
    { _dssr1VolumeARN = Nothing
    , _dssr1Status = pStatus
    }

-- | FIXME: Undocumented member.
dssr1VolumeARN :: Lens' DeleteSnapshotScheduleResponse (Maybe Text)
dssr1VolumeARN = lens _dssr1VolumeARN (\ s a -> s{_dssr1VolumeARN = a});

-- | FIXME: Undocumented member.
dssr1Status :: Lens' DeleteSnapshotScheduleResponse Int
dssr1Status = lens _dssr1Status (\ s a -> s{_dssr1Status = a});
