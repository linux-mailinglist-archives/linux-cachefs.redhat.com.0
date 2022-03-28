Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id BC1474E8C7E
	for <lists+linux-cachefs@lfdr.de>; Mon, 28 Mar 2022 05:15:32 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-497-iQ2eF2jPMnqads481dRU-g-1; Sun, 27 Mar 2022 23:15:30 -0400
X-MC-Unique: iQ2eF2jPMnqads481dRU-g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C4167899EC1;
	Mon, 28 Mar 2022 03:15:29 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B714B112131B;
	Mon, 28 Mar 2022 03:15:29 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 980711947BBC;
	Mon, 28 Mar 2022 03:15:29 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id A95C619451F1 for <linux-cachefs@listman.corp.redhat.com>;
 Mon, 28 Mar 2022 03:15:28 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 98C9FC44AEA; Mon, 28 Mar 2022 03:15:28 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 950FFC44AE4
 for <linux-cachefs@redhat.com>; Mon, 28 Mar 2022 03:15:28 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7CEF92A59559
 for <linux-cachefs@redhat.com>; Mon, 28 Mar 2022 03:15:28 +0000 (UTC)
Received: from out30-133.freemail.mail.aliyun.com
 (out30-133.freemail.mail.aliyun.com [115.124.30.133]) by relay.mimecast.com
 with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-26-9n0a6qPhOo6nTLoA4pYxpQ-1; Sun, 27 Mar 2022 23:15:26 -0400
X-MC-Unique: 9n0a6qPhOo6nTLoA4pYxpQ-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R191e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04357; MF=jefflexu@linux.alibaba.com;
 NM=1; PH=DS; RN=18; SR=0; TI=SMTPD_---0V8KfeNU_1648437319
Received: from 30.225.24.93(mailfrom:jefflexu@linux.alibaba.com
 fp:SMTPD_---0V8KfeNU_1648437319) by smtp.aliyun-inc.com(127.0.0.1);
 Mon, 28 Mar 2022 11:15:21 +0800
Message-ID: <21126dc4-2b15-bb12-d4d3-b8703be95539@linux.alibaba.com>
Date: Mon, 28 Mar 2022 11:15:19 +0800
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
References: <20220325122223.102958-1-jefflexu@linux.alibaba.com>
 <20220325122223.102958-16-jefflexu@linux.alibaba.com>
 <YkElyeMDdt3hQKGi@B-P7TQMD6M-0146.local>
From: JeffleXu <jefflexu@linux.alibaba.com>
In-Reply-To: <YkElyeMDdt3hQKGi@B-P7TQMD6M-0146.local>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Mimecast-Bulk-Signature: yes
X-Mimecast-Spam-Signature: bulk
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Subject: Re: [Linux-cachefs] [PATCH v6 15/22] erofs: register cookie context
 for bootstrap blob
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On 3/28/22 11:04 AM, Gao Xiang wrote:
> On Fri, Mar 25, 2022 at 08:22:16PM +0800, Jeffle Xu wrote:
>> Registers fscache_cookie for the bootstrap blob file. The bootstrap blob
>> file can be specified by a new mount option, which is going to be
>> introduced by a following patch.
>>
>> Something worth mentioning about the cleanup routine.
>>
>> 1. The init routine is prior to when the root inode gets initialized,
>> and thus the corresponding cleanup routine shall be placed inside
>> .kill_sb() callback.
>>
>> 2. The init routine will instantiate anonymous inodes under the
>> super_block, and thus .put_super() callback shall also contain the
>> cleanup routine. Or we'll get "VFS: Busy inodes after unmount." warning.
>>
>> Signed-off-by: Jeffle Xu <jefflexu@linux.alibaba.com>
>> ---
>>  fs/erofs/internal.h |  3 +++
>>  fs/erofs/super.c    | 17 +++++++++++++++++
>>  2 files changed, 20 insertions(+)
>>
>> diff --git a/fs/erofs/internal.h b/fs/erofs/internal.h
>> index 459f31803c3b..d8c886a7491e 100644
>> --- a/fs/erofs/internal.h
>> +++ b/fs/erofs/internal.h
>> @@ -73,6 +73,7 @@ struct erofs_mount_opts {
>>  	/* threshold for decompression synchronously */
>>  	unsigned int max_sync_decompress_pages;
>>  #endif
>> +	char *tag;
>>  	unsigned int mount_opt;
>>  };
>>  
>> @@ -151,6 +152,8 @@ struct erofs_sb_info {
>>  	/* sysfs support */
>>  	struct kobject s_kobj;		/* /sys/fs/erofs/<devname> */
>>  	struct completion s_kobj_unregister;
>> +
>> +	struct erofs_fscache *bootstrap;
> 
> the concept of bootstrap is nydus-specific. Actually here we need
> a fscache context of the primary device.
> 
> So I prefer struct erofs_fscache *s_fscache;
> 
> Also please help revise the subject and commit message about
> bootstrap.
> 

OK, will be done in the next version.


-- 
Thanks,
Jeffle

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

