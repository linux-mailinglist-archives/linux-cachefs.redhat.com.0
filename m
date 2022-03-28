Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id EAC164E8C76
	for <lists+linux-cachefs@lfdr.de>; Mon, 28 Mar 2022 05:11:59 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-21-Ic-CmpX5NkGKI4Y9XZagVQ-1; Sun, 27 Mar 2022 23:11:55 -0400
X-MC-Unique: Ic-CmpX5NkGKI4Y9XZagVQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 44C651C01504;
	Mon, 28 Mar 2022 03:11:55 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 02AC91402648;
	Mon, 28 Mar 2022 03:11:55 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id C72111947BBC;
	Mon, 28 Mar 2022 03:11:54 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id F3EAC19451F1 for <linux-cachefs@listman.corp.redhat.com>;
 Mon, 28 Mar 2022 03:11:52 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id D07CC401E4B; Mon, 28 Mar 2022 03:11:52 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CCA81401474
 for <linux-cachefs@redhat.com>; Mon, 28 Mar 2022 03:11:52 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B3929101AA44
 for <linux-cachefs@redhat.com>; Mon, 28 Mar 2022 03:11:52 +0000 (UTC)
Received: from out199-5.us.a.mail.aliyun.com (out199-5.us.a.mail.aliyun.com
 [47.90.199.5]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-594-Jo2uxC5UNfCyaoTJUbdCGQ-1; Sun, 27 Mar 2022 23:11:50 -0400
X-MC-Unique: Jo2uxC5UNfCyaoTJUbdCGQ-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R731e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04395; MF=jefflexu@linux.alibaba.com;
 NM=1; PH=DS; RN=18; SR=0; TI=SMTPD_---0V8Kie8j_1648437104
Received: from 30.225.24.93(mailfrom:jefflexu@linux.alibaba.com
 fp:SMTPD_---0V8Kie8j_1648437104) by smtp.aliyun-inc.com(127.0.0.1);
 Mon, 28 Mar 2022 11:11:46 +0800
Message-ID: <f1455f47-dbeb-46cb-69bd-5edf193f69fe@linux.alibaba.com>
Date: Mon, 28 Mar 2022 11:11:43 +0800
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
 <20220325122223.102958-13-jefflexu@linux.alibaba.com>
 <Yj3GlpvjL3u0RTjN@B-P7TQMD6M-0146.local>
From: JeffleXu <jefflexu@linux.alibaba.com>
In-Reply-To: <Yj3GlpvjL3u0RTjN@B-P7TQMD6M-0146.local>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Mimecast-Bulk-Signature: yes
X-Mimecast-Spam-Signature: bulk
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Subject: Re: [Linux-cachefs] [PATCH v6 12/22] erofs: add cookie context
 helper functions
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
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On 3/25/22 9:41 PM, Gao Xiang wrote:
> Hi Jeffle,
> 
> On Fri, Mar 25, 2022 at 08:22:13PM +0800, Jeffle Xu wrote:
>> Introduce "struct erofs_fscache" for managing cookie for backinig file,
>> and helper functions for initializing and cleaning up this context
>> structure.
>>
>> Signed-off-by: Jeffle Xu <jefflexu@linux.alibaba.com>
>> ---
>>  fs/erofs/fscache.c  | 61 +++++++++++++++++++++++++++++++++++++++++++++
>>  fs/erofs/internal.h | 14 +++++++++++
>>  2 files changed, 75 insertions(+)
>>
>> diff --git a/fs/erofs/fscache.c b/fs/erofs/fscache.c
>> index 08cf570a0810..73235fd43bf6 100644
>> --- a/fs/erofs/fscache.c
>> +++ b/fs/erofs/fscache.c
>> @@ -7,6 +7,67 @@
>>  
>>  static struct fscache_volume *volume;
>>  
>> +static int erofs_fscache_init_cookie(struct erofs_fscache *ctx, char *path)
>> +{
>> +	struct fscache_cookie *cookie;
>> +
>> +	cookie = fscache_acquire_cookie(volume, FSCACHE_ADV_WANT_CACHE_SIZE,
>> +					path, strlen(path),
>> +					NULL, 0, 0);
> 
> It'd be better to rearrange in one line?

Sure.

> 
> 					path, strlen(path), NULL, 0, 0);
> 
>> +	if (!cookie)
>> +		return -EINVAL;
>> +
>> +	fscache_use_cookie(cookie, false);
>> +	ctx->cookie = cookie;
>> +	return 0;
>> +}
>> +
>> +static inline void erofs_fscache_cleanup_cookie(struct erofs_fscache *ctx)
>> +{
>> +	struct fscache_cookie *cookie = ctx->cookie;
>> +
>> +	fscache_unuse_cookie(cookie, NULL, NULL);
>> +	fscache_relinquish_cookie(cookie, false);
>> +	ctx->cookie = NULL;
>> +}
>> +
>> +/*
>> + * erofs_fscache_get - create an fscache context for blob file
>> + * @sb:		superblock
>> + * @path:	name of blob file
>> + *
>> + * Return: fscache context on success, ERR_PTR() on failure.
>> + */
>> +struct erofs_fscache *erofs_fscache_get(struct super_block *sb, char *path)
> 
> erofs_fscache_register?

OK.


> 
>> +{
>> +	struct erofs_fscache *ctx;
>> +	int ret;
>> +
>> +	ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
>> +	if (!ctx)
>> +		return ERR_PTR(-ENOMEM);
>> +
>> +	ret = erofs_fscache_init_cookie(ctx, path);
> 
> Can we fold it here? No need to introduce such simple wrapper..
> 
>> +	if (ret) {
>> +		erofs_err(sb, "failed to init cookie");
> 
> It would be better to print the path?

OK.

> 
>> +		goto err;
> 
> 		kfree(ctx);
> 		return ERR_PTR(ret);
> 
> At least for now.

Yeah, it's better.

> 
>> +	}
>> +
>> +	return ctx;
>> +err:
>> +	kfree(ctx);
>> +	return ERR_PTR(ret);
>> +}
>> +
>> +void erofs_fscache_put(struct erofs_fscache *ctx)
> 
> erofs_fscache_unregister?

OK.

> 
>> +{
>> +	if (!ctx)
>> +		return;
>> +
>> +	erofs_fscache_cleanup_cookie(ctx);
> 
> Fold it too, since such helper doesn't simplify code a lot but need
> to take one more time to redirect..

OK.

-- 
Thanks,
Jeffle

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

