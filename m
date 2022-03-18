Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E57ED4DD45E
	for <lists+linux-cachefs@lfdr.de>; Fri, 18 Mar 2022 06:27:10 +0100 (CET)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-631-ZOn9Me22Phu2tLw5cYivKw-1; Fri, 18 Mar 2022 01:27:06 -0400
X-MC-Unique: ZOn9Me22Phu2tLw5cYivKw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4451280231F;
	Fri, 18 Mar 2022 05:27:06 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A7AE340D2962;
	Fri, 18 Mar 2022 05:27:02 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 3FA8C194E015;
	Fri, 18 Mar 2022 05:27:02 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 08EFC1949761 for <linux-cachefs@listman.corp.redhat.com>;
 Fri, 18 Mar 2022 05:27:01 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id C5073C3326A; Fri, 18 Mar 2022 05:27:00 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C15E9C33260
 for <linux-cachefs@redhat.com>; Fri, 18 Mar 2022 05:27:00 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A548B3804501
 for <linux-cachefs@redhat.com>; Fri, 18 Mar 2022 05:27:00 +0000 (UTC)
Received: from out30-56.freemail.mail.aliyun.com
 (out30-56.freemail.mail.aliyun.com [115.124.30.56]) by relay.mimecast.com
 with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-407-0HNz55owPWuaZSmH0M6dDQ-1; Fri, 18 Mar 2022 01:26:56 -0400
X-MC-Unique: 0HNz55owPWuaZSmH0M6dDQ-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R151e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04426; MF=jefflexu@linux.alibaba.com;
 NM=1; PH=DS; RN=16; SR=0; TI=SMTPD_---0V7UqACk_1647581210
Received: from 30.225.24.52(mailfrom:jefflexu@linux.alibaba.com
 fp:SMTPD_---0V7UqACk_1647581210) by smtp.aliyun-inc.com(127.0.0.1);
 Fri, 18 Mar 2022 13:26:51 +0800
Message-ID: <ce8a179d-db54-d787-dc89-1a8d4de32c14@linux.alibaba.com>
Date: Fri, 18 Mar 2022 13:26:50 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
To: dhowells@redhat.com, linux-cachefs@redhat.com, xiang@kernel.org,
 chao@kernel.org, linux-erofs@lists.ozlabs.org, gregkh@linuxfoundation.org,
 tao.peng@linux.alibaba.com, willy@infradead.org,
 linux-kernel@vger.kernel.org, joseph.qi@linux.alibaba.com,
 bo.liu@linux.alibaba.com, linux-fsdevel@vger.kernel.org,
 luodaowen.backend@bytedance.com, eguan@linux.alibaba.com,
 gerry@linux.alibaba.com, torvalds@linux-foundation.org
References: <20220316131723.111553-1-jefflexu@linux.alibaba.com>
 <20220316131723.111553-11-jefflexu@linux.alibaba.com>
 <YjLI0cCcxtg/rEHj@B-P7TQMD6M-0146.local>
From: JeffleXu <jefflexu@linux.alibaba.com>
In-Reply-To: <YjLI0cCcxtg/rEHj@B-P7TQMD6M-0146.local>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Subject: Re: [Linux-cachefs] [PATCH v5 10/22] erofs: add mode checking helper
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
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On 3/17/22 1:36 PM, Gao Xiang wrote:
> On Wed, Mar 16, 2022 at 09:17:11PM +0800, Jeffle Xu wrote:
>> Until then erofs is exactly blockdev based filesystem. In other using
>> scenarios (e.g. container image), erofs needs to run upon files.
>>
>> This patch set is going to introduces a new nodev mode, in which erofs
>> could be mounted from a bootstrap blob file containing complete erofs
>> image.
>>
>> Add a helper checking which mode erofs works in.
>>
>> Signed-off-by: Jeffle Xu <jefflexu@linux.alibaba.com>
>> ---
>>  fs/erofs/internal.h | 5 +++++
>>  1 file changed, 5 insertions(+)
>>
>> diff --git a/fs/erofs/internal.h b/fs/erofs/internal.h
>> index e424293f47a2..f66af9ebda43 100644
>> --- a/fs/erofs/internal.h
>> +++ b/fs/erofs/internal.h
>> @@ -161,6 +161,11 @@ struct erofs_sb_info {
>>  #define set_opt(opt, option)	((opt)->mount_opt |= EROFS_MOUNT_##option)
>>  #define test_opt(opt, option)	((opt)->mount_opt & EROFS_MOUNT_##option)
>>  
>> +static inline bool erofs_bdev_mode(struct super_block *sb)
> 
> How about renaming it as erofs_is_nodev_mode()?

Sure, will be renamed in the next version.


-- 
Thanks,
Jeffle

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

