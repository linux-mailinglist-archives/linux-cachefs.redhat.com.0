Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FC3B50ADF4
	for <lists+linux-cachefs@lfdr.de>; Fri, 22 Apr 2022 04:44:52 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-48-BCIknwaXP6yI0fynRFi3Nw-1; Thu, 21 Apr 2022 22:44:48 -0400
X-MC-Unique: BCIknwaXP6yI0fynRFi3Nw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 882FE29ABA26;
	Fri, 22 Apr 2022 02:44:47 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A5600C33B1B;
	Fri, 22 Apr 2022 02:44:44 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 07AC9194034A;
	Fri, 22 Apr 2022 02:44:44 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id DBE2919451EF for <linux-cachefs@listman.corp.redhat.com>;
 Fri, 22 Apr 2022 02:44:42 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id A8A122166B14; Fri, 22 Apr 2022 02:44:42 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A43192166B4E
 for <linux-cachefs@redhat.com>; Fri, 22 Apr 2022 02:44:34 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3B537101AA42
 for <linux-cachefs@redhat.com>; Fri, 22 Apr 2022 02:44:34 +0000 (UTC)
Received: from out30-54.freemail.mail.aliyun.com
 (out30-54.freemail.mail.aliyun.com [115.124.30.54]) by relay.mimecast.com
 with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-623-NDgvIrB0MZmw_VcsC3dViw-1; Thu, 21 Apr 2022 22:44:30 -0400
X-MC-Unique: NDgvIrB0MZmw_VcsC3dViw-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R101e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04395; MF=jefflexu@linux.alibaba.com;
 NM=1; PH=DS; RN=19; SR=0; TI=SMTPD_---0VAjn9jI_1650595459
Received: from 30.225.24.197(mailfrom:jefflexu@linux.alibaba.com
 fp:SMTPD_---0VAjn9jI_1650595459) by smtp.aliyun-inc.com(127.0.0.1);
 Fri, 22 Apr 2022 10:44:22 +0800
Message-ID: <cb91ef9f-62ab-6bca-2bde-ac1977ec6f37@linux.alibaba.com>
Date: Fri, 22 Apr 2022 10:44:19 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
To: David Howells <dhowells@redhat.com>
References: <20220415123614.54024-4-jefflexu@linux.alibaba.com>
 <20220415123614.54024-1-jefflexu@linux.alibaba.com>
 <1444916.1650549738@warthog.procyon.org.uk>
From: JeffleXu <jefflexu@linux.alibaba.com>
In-Reply-To: <1444916.1650549738@warthog.procyon.org.uk>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Subject: Re: [Linux-cachefs] [PATCH v9 03/21] cachefiles: unbind cachefiles
 gracefully in on-demand mode
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
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On 4/21/22 10:02 PM, David Howells wrote:
> Jeffle Xu <jefflexu@linux.alibaba.com> wrote:
> 
>> +	struct kref			unbind_pincount;/* refcount to do daemon unbind */
> 
> Please use refcount_t or atomic_t, especially as this isn't the refcount for
> the structure.

Okay, will be done in the next version.

> 
>> -	cachefiles_daemon_unbind(cache);
>> -
>>  	/* clean up the control file interface */
>>  	cache->cachefilesd = NULL;
>>  	file->private_data = NULL;
>>  	cachefiles_open = 0;
> 
> Please call cachefiles_daemon_unbind() before the cleanup.

Since the cachefiles_struct struct will be freed once the pincount is
decreased to 0, "cache->cachefilesd = NULL;" needs to be done before
decreasing the pincount. BTW, "cachefiles_open = 0;" indeed should be
done only when pincount has been decreased to 0.


-- 
Thanks,
Jeffle

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

