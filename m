Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F7EF4F8BE6
	for <lists+linux-cachefs@lfdr.de>; Fri,  8 Apr 2022 04:12:08 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-339-kq3PuQBKO1CDj22y-y42Og-1; Thu, 07 Apr 2022 22:12:04 -0400
X-MC-Unique: kq3PuQBKO1CDj22y-y42Og-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D36993C11C9A;
	Fri,  8 Apr 2022 02:12:03 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 364FEC28122;
	Fri,  8 Apr 2022 02:12:02 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id CAC4B1940344;
	Fri,  8 Apr 2022 02:11:59 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id A766D1949761 for <linux-cachefs@listman.corp.redhat.com>;
 Fri,  8 Apr 2022 02:11:58 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 36D31145BA45; Fri,  8 Apr 2022 02:11:58 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 32AE1145BA44
 for <linux-cachefs@redhat.com>; Fri,  8 Apr 2022 02:11:58 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1921B1014A68
 for <linux-cachefs@redhat.com>; Fri,  8 Apr 2022 02:11:58 +0000 (UTC)
Received: from out30-42.freemail.mail.aliyun.com
 (out30-42.freemail.mail.aliyun.com [115.124.30.42]) by relay.mimecast.com
 with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-671-fdeRamMwNleCz7__C4EssQ-1; Thu, 07 Apr 2022 22:11:55 -0400
X-MC-Unique: fdeRamMwNleCz7__C4EssQ-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R211e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04395; MF=jefflexu@linux.alibaba.com;
 NM=1; PH=DS; RN=18; SR=0; TI=SMTPD_---0V9TMXhB_1649383908
Received: from 30.225.24.70(mailfrom:jefflexu@linux.alibaba.com
 fp:SMTPD_---0V9TMXhB_1649383908) by smtp.aliyun-inc.com(127.0.0.1);
 Fri, 08 Apr 2022 10:11:49 +0800
Message-ID: <ac8571b8-0935-1f4f-e9f1-e424f059b5ed@linux.alibaba.com>
Date: Fri, 8 Apr 2022 10:11:47 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
To: dhowells@redhat.com, linux-cachefs@redhat.com, xiang@kernel.org,
 chao@kernel.org, linux-erofs@lists.ozlabs.org,
 torvalds@linux-foundation.org, gregkh@linuxfoundation.org,
 willy@infradead.org, linux-fsdevel@vger.kernel.org,
 joseph.qi@linux.alibaba.com, bo.liu@linux.alibaba.com,
 tao.peng@linux.alibaba.com, gerry@linux.alibaba.com,
 eguan@linux.alibaba.com, linux-kernel@vger.kernel.org,
 luodaowen.backend@bytedance.com, tianzichen@kuaishou.com, fannaihao@baidu.com
References: <20220406075612.60298-1-jefflexu@linux.alibaba.com>
 <20220406075612.60298-16-jefflexu@linux.alibaba.com>
 <Yk7yCp2fwnbXeyuI@debian>
From: JeffleXu <jefflexu@linux.alibaba.com>
In-Reply-To: <Yk7yCp2fwnbXeyuI@debian>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Subject: Re: [Linux-cachefs] [PATCH v8 15/20] erofs: register fscache
 context for extra data blobs
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-cachefs>, 
 <mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/linux-cachefs/>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-cachefs>,
 <mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On 4/7/22 10:15 PM, Gao Xiang wrote:
> On Wed, Apr 06, 2022 at 03:56:07PM +0800, Jeffle Xu wrote:
>> Similar to the multi device mode, erofs could be mounted from one
>> primary data blob (mandatory) and multiple extra data blobs (optional).
>>
>> Register fscache context for each extra data blob.
>>
>> Signed-off-by: Jeffle Xu <jefflexu@linux.alibaba.com>
>> ---
>>  fs/erofs/data.c     |  3 +++
>>  fs/erofs/internal.h |  2 ++
>>  fs/erofs/super.c    | 25 +++++++++++++++++--------
>>  3 files changed, 22 insertions(+), 8 deletions(-)
>>
>> diff --git a/fs/erofs/data.c b/fs/erofs/data.c
>> index bc22642358ec..14b64d960541 100644
>> --- a/fs/erofs/data.c
>> +++ b/fs/erofs/data.c
>> @@ -199,6 +199,7 @@ int erofs_map_dev(struct super_block *sb, struct erofs_map_dev *map)
>>  	map->m_bdev = sb->s_bdev;
>>  	map->m_daxdev = EROFS_SB(sb)->dax_dev;
>>  	map->m_dax_part_off = EROFS_SB(sb)->dax_part_off;
>> +	map->m_fscache = EROFS_SB(sb)->s_fscache;
>>  
>>  	if (map->m_deviceid) {
>>  		down_read(&devs->rwsem);
>> @@ -210,6 +211,7 @@ int erofs_map_dev(struct super_block *sb, struct erofs_map_dev *map)
>>  		map->m_bdev = dif->bdev;
>>  		map->m_daxdev = dif->dax_dev;
>>  		map->m_dax_part_off = dif->dax_part_off;
>> +		map->m_fscache = dif->fscache;
>>  		up_read(&devs->rwsem);
>>  	} else if (devs->extra_devices) {
>>  		down_read(&devs->rwsem);
>> @@ -227,6 +229,7 @@ int erofs_map_dev(struct super_block *sb, struct erofs_map_dev *map)
>>  				map->m_bdev = dif->bdev;
>>  				map->m_daxdev = dif->dax_dev;
>>  				map->m_dax_part_off = dif->dax_part_off;
>> +				map->m_fscache = dif->fscache;
>>  				break;
>>  			}
>>  		}
>> diff --git a/fs/erofs/internal.h b/fs/erofs/internal.h
>> index eb37b33bce37..90f7d6286a4f 100644
>> --- a/fs/erofs/internal.h
>> +++ b/fs/erofs/internal.h
>> @@ -49,6 +49,7 @@ typedef u32 erofs_blk_t;
>>  
>>  struct erofs_device_info {
>>  	char *path;
>> +	struct erofs_fscache *fscache;
>>  	struct block_device *bdev;
>>  	struct dax_device *dax_dev;
>>  	u64 dax_part_off;
>> @@ -482,6 +483,7 @@ static inline int z_erofs_map_blocks_iter(struct inode *inode,
>>  #endif	/* !CONFIG_EROFS_FS_ZIP */
>>  
>>  struct erofs_map_dev {
>> +	struct erofs_fscache *m_fscache;
>>  	struct block_device *m_bdev;
>>  	struct dax_device *m_daxdev;
>>  	u64 m_dax_part_off;
>> diff --git a/fs/erofs/super.c b/fs/erofs/super.c
>> index 9498b899b73b..8c7181cd37e6 100644
>> --- a/fs/erofs/super.c
>> +++ b/fs/erofs/super.c
>> @@ -259,15 +259,23 @@ static int erofs_init_devices(struct super_block *sb,
>>  		}
>>  		dis = ptr + erofs_blkoff(pos);
>>  
>> -		bdev = blkdev_get_by_path(dif->path,
>> -					  FMODE_READ | FMODE_EXCL,
>> -					  sb->s_type);
>> -		if (IS_ERR(bdev)) {
>> -			err = PTR_ERR(bdev);
>> -			break;
>> +		if (erofs_is_fscache_mode(sb)) {
>> +			err = erofs_fscache_register_cookie(sb, &dif->fscache,
>> +							    dif->path, false);
>> +			if (err)
>> +				break;
>> +		} else {
>> +			bdev = blkdev_get_by_path(dif->path,
>> +						  FMODE_READ | FMODE_EXCL,
>> +						  sb->s_type);
>> +			if (IS_ERR(bdev)) {
>> +				err = PTR_ERR(bdev);
>> +				break;
>> +			}
>> +			dif->bdev = bdev;
>> +			dif->dax_dev = fs_dax_get_by_bdev(bdev, &dif->dax_part_off);
> 
> Overly long line, please help split into 2 lines if possible.
> 

Will be fixed in the next version.


-- 
Thanks,
Jeffle

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

