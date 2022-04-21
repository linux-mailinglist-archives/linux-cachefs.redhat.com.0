Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id DF8AD50A3D6
	for <lists+linux-cachefs@lfdr.de>; Thu, 21 Apr 2022 17:18:15 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-604-LOZ-On6LM26VTvY5cBywkg-1; Thu, 21 Apr 2022 11:18:11 -0400
X-MC-Unique: LOZ-On6LM26VTvY5cBywkg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 329FA29DD989;
	Thu, 21 Apr 2022 15:18:11 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0E6EC54CE4D;
	Thu, 21 Apr 2022 15:18:11 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id D53FC1940347;
	Thu, 21 Apr 2022 15:18:10 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id A721819451EF for <linux-cachefs@listman.corp.redhat.com>;
 Thu, 21 Apr 2022 15:18:09 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 971F4C2813B; Thu, 21 Apr 2022 15:18:09 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 930B1C33AE8
 for <linux-cachefs@redhat.com>; Thu, 21 Apr 2022 15:18:09 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 095D2800B28
 for <linux-cachefs@redhat.com>; Thu, 21 Apr 2022 15:18:09 +0000 (UTC)
Received: from out199-7.us.a.mail.aliyun.com (out199-7.us.a.mail.aliyun.com
 [47.90.199.7]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-610-Ep7j-3yQPNK87iScHkkW2Q-1; Thu, 21 Apr 2022 11:18:06 -0400
X-MC-Unique: Ep7j-3yQPNK87iScHkkW2Q-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R121e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04357; MF=jefflexu@linux.alibaba.com;
 NM=1; PH=DS; RN=19; SR=0; TI=SMTPD_---0VAg.y.s_1650553903
Received: from 192.168.31.65(mailfrom:jefflexu@linux.alibaba.com
 fp:SMTPD_---0VAg.y.s_1650553903) by smtp.aliyun-inc.com(127.0.0.1);
 Thu, 21 Apr 2022 23:11:45 +0800
Message-ID: <a79e09a0-16d2-4d73-af9f-05a259431040@linux.alibaba.com>
Date: Thu, 21 Apr 2022 23:11:43 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
To: David Howells <dhowells@redhat.com>
References: <20220415123614.54024-7-jefflexu@linux.alibaba.com>
 <20220415123614.54024-1-jefflexu@linux.alibaba.com>
 <1445691.1650550659@warthog.procyon.org.uk>
From: JeffleXu <jefflexu@linux.alibaba.com>
In-Reply-To: <1445691.1650550659@warthog.procyon.org.uk>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Subject: Re: [Linux-cachefs] [PATCH v9 06/21] cachefiles: enable on-demand
 read mode
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
Cc: linux-erofs@lists.ozlabs.org, chao@kernel.org, fannaihao@baidu.com,
 tao.peng@linux.alibaba.com, willy@infradead.org, linux-kernel@vger.kernel.org,
 tianzichen@kuaishou.com, joseph.qi@linux.alibaba.com,
 zhangjiachen.jaycee@bytedance.com, linux-cachefs@redhat.com,
 bo.liu@linux.alibaba.com, gregkh@linuxfoundation.org,
 linux-fsdevel@vger.kernel.org, luodaowen.backend@bytedance.com,
 xiang@kernel.org, gerry@linux.alibaba.com, torvalds@linux-foundation.org,
 eguan@linux.alibaba.com
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On 4/21/22 10:17 PM, David Howells wrote:
> Jeffle Xu <jefflexu@linux.alibaba.com> wrote:
> 
>> +	if (IS_ENABLED(CONFIG_CACHEFILES_ONDEMAND) &&
>> +	    !strcmp(args, "ondemand")) {
>> +		set_bit(CACHEFILES_ONDEMAND_MODE, &cache->flags);
>> +	} else if (*args) {
>> +		pr_err("'bind' command doesn't take an argument\n");
> 
> The error message isn't true if CONFIG_CACHEFILES_ONDEMAND=y.  It would be
> better to say "Invalid argument to the 'bind' command".

Right. Or users may gets confused then. Will be fixed in the next version.

> 
>> -retry:
>>  	/* If the caller asked us to seek for data before doing the read, then
>>  	 * we should do that now.  If we find a gap, we fill it with zeros.
>>  	 */
>> @@ -120,16 +119,6 @@ static int cachefiles_read(struct netfs_cache_resources *cres,
>>  			if (read_hole == NETFS_READ_HOLE_FAIL)
>>  				goto presubmission_error;
>>  
>> -			if (read_hole == NETFS_READ_HOLE_ONDEMAND) {
>> -				ret = cachefiles_ondemand_read(object, off, len);
>> -				if (ret)
>> -					goto presubmission_error;
>> -
>> -				/* fail the read if no progress achieved */
>> -				read_hole = NETFS_READ_HOLE_FAIL;
>> -				goto retry;
>> -			}
>> -
> 

Sorry, it's my mistake when doing "git rebase". The previous version
(v8) actually calls cachefiles_ondemand_read() in cachefiles_read().
However as explained in the commit message of patch 5 ("cachefiles:
implement on-demand read"), fscache_read() can only detect if the
requested file range is fully cache miss, whilst it can't detect if it
is partial cache miss, i.e. there's a hole inside the requested file range.

Thus in this patchset (v9), we move the entry of calling
cachefiles_ondemand_read() from cachefiles_read() to
cachefiles_prepare_read(). The above "deletion of newly added code" is
actually reverting the previous change to cachefiles_read(). It was
mistakenly merged to this patch when I was doing "git rebase"...
Actually it should be merged to patch 5 ("cachefiles: implement
on-demand read"), which initially introduce the change to cachefiles_read().

Apologize for the careless mistake...


-- 
Thanks,
Jeffle

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

