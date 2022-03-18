Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 103044DD465
	for <lists+linux-cachefs@lfdr.de>; Fri, 18 Mar 2022 06:29:39 +0100 (CET)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-14-aSEqZz6sPJGrT5nO3P6CXg-1; Fri, 18 Mar 2022 01:29:36 -0400
X-MC-Unique: aSEqZz6sPJGrT5nO3P6CXg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 76B45101A54C;
	Fri, 18 Mar 2022 05:29:35 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6BE0A112C08E;
	Fri, 18 Mar 2022 05:29:35 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 2BD01194E015;
	Fri, 18 Mar 2022 05:29:35 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id AA58E1949761 for <linux-cachefs@listman.corp.redhat.com>;
 Fri, 18 Mar 2022 05:29:34 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 8BB74C15D5A; Fri, 18 Mar 2022 05:29:34 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 882B6C15D57
 for <linux-cachefs@redhat.com>; Fri, 18 Mar 2022 05:29:34 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6E51F85A5A8
 for <linux-cachefs@redhat.com>; Fri, 18 Mar 2022 05:29:34 +0000 (UTC)
Received: from out30-44.freemail.mail.aliyun.com
 (out30-44.freemail.mail.aliyun.com [115.124.30.44]) by relay.mimecast.com
 with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-527-r9oqdT0vPQGWfbemciO9YA-1; Fri, 18 Mar 2022 01:29:30 -0400
X-MC-Unique: r9oqdT0vPQGWfbemciO9YA-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R101e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04407; MF=jefflexu@linux.alibaba.com;
 NM=1; PH=DS; RN=16; SR=0; TI=SMTPD_---0V7UWZ7Y_1647581363
Received: from 30.225.24.52(mailfrom:jefflexu@linux.alibaba.com
 fp:SMTPD_---0V7UWZ7Y_1647581363) by smtp.aliyun-inc.com(127.0.0.1);
 Fri, 18 Mar 2022 13:29:25 +0800
Message-ID: <a8be4038-720f-d604-03fc-f958e9083680@linux.alibaba.com>
Date: Fri, 18 Mar 2022 13:29:23 +0800
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
 <20220316131723.111553-18-jefflexu@linux.alibaba.com>
 <YjLSyLGDtSrwJLHN@B-P7TQMD6M-0146.local>
From: JeffleXu <jefflexu@linux.alibaba.com>
In-Reply-To: <YjLSyLGDtSrwJLHN@B-P7TQMD6M-0146.local>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Subject: Re: [Linux-cachefs] [PATCH v5 17/22] erofs: implement fscache-based
 data read for non-inline layout
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



On 3/17/22 2:18 PM, Gao Xiang wrote:
> On Wed, Mar 16, 2022 at 09:17:18PM +0800, Jeffle Xu wrote:
>> This patch implements the data plane of reading data from bootstrap blob
>> file over fscache for non-inline layout.
>>
>> Be noted that compressed layout is not supported yet.
>>
>> Signed-off-by: Jeffle Xu <jefflexu@linux.alibaba.com>
>> ---
>>  fs/erofs/fscache.c  | 94 +++++++++++++++++++++++++++++++++++++++++++++
>>  fs/erofs/inode.c    |  6 ++-
>>  fs/erofs/internal.h |  1 +
>>  3 files changed, 100 insertions(+), 1 deletion(-)
>>
>> diff --git a/fs/erofs/fscache.c b/fs/erofs/fscache.c
>> index 654414aa87ad..df56562f33c4 100644
>> --- a/fs/erofs/fscache.c
>> +++ b/fs/erofs/fscache.c
>> @@ -4,6 +4,12 @@
>>   */
>>  #include "internal.h"
>>  
>> +struct erofs_fscache_map {
>> +	struct erofs_fscache_context *m_ctx;
>> +	erofs_off_t m_pa, m_la, o_la;
>> +	u64 m_llen;
> 
> Can we directly use "struct erofs_map_blocks map"?
> So "erofs_fscache_get_map" can be avoided then.

OK, the extra fields will be folded into "struct erofs_map_blocks map".

-- 
Thanks,
Jeffle

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

