Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 93B335A12D1
	for <lists+linux-cachefs@lfdr.de>; Thu, 25 Aug 2022 15:59:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1661435951;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=/m81Qt86RFRM5Jigr1JmSukr1/X4IgXP5JaxTXTEs84=;
	b=TbSGIpM5r1PPqcEXyjavJuhC4YA2gQsox/xmFbBTPPbM/eXeFEYv6QTR3huaI1JoKNDaSx
	azCYIrNlXyRJusphw5PhpylUjBwgcFxzEYD1oZan3w2fMh74DizL7nQ/uTxA+qz4RlOWr7
	gIr7jIk2Z2a4PqmvjIdz2oGB/6Hocc0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-91-kGnrAsm9PIKpEeBQ_QETAg-1; Thu, 25 Aug 2022 09:59:08 -0400
X-MC-Unique: kGnrAsm9PIKpEeBQ_QETAg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EDDB88032FB;
	Thu, 25 Aug 2022 13:59:07 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E30C140B40CB;
	Thu, 25 Aug 2022 13:59:07 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id B56C21946A5E;
	Thu, 25 Aug 2022 13:59:07 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 386A31946A43 for <linux-cachefs@listman.corp.redhat.com>;
 Thu, 25 Aug 2022 13:59:06 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 2A3342166B29; Thu, 25 Aug 2022 13:59:06 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 26C892166B26
 for <linux-cachefs@redhat.com>; Thu, 25 Aug 2022 13:59:06 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0D919185A7BA
 for <linux-cachefs@redhat.com>; Thu, 25 Aug 2022 13:59:06 +0000 (UTC)
Received: from out30-131.freemail.mail.aliyun.com
 (out30-131.freemail.mail.aliyun.com [115.124.30.131]) by relay.mimecast.com
 with ESMTP with STARTTLS (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256)
 id us-mta-466-5TVeb1V_M1i8ZF2Pb2TSQA-1; Thu, 25 Aug 2022 09:59:01 -0400
X-MC-Unique: 5TVeb1V_M1i8ZF2Pb2TSQA-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R871e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045176;
 MF=hsiangkao@linux.alibaba.com; NM=1; PH=DS; RN=7; SR=0;
 TI=SMTPD_---0VNDo9.X_1661435929
Received: from B-P7TQMD6M-0146.local(mailfrom:hsiangkao@linux.alibaba.com
 fp:SMTPD_---0VNDo9.X_1661435929) by smtp.aliyun-inc.com;
 Thu, 25 Aug 2022 21:58:52 +0800
Date: Thu, 25 Aug 2022 21:58:49 +0800
From: Gao Xiang <hsiangkao@linux.alibaba.com>
To: Sun Ke <sunke32@huawei.com>, Dan Carpenter <dan.carpenter@oracle.com>
Message-ID: <YweAGTuBw1hWm8PW@B-P7TQMD6M-0146.local>
Mail-Followup-To: Sun Ke <sunke32@huawei.com>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 JeffleXu <jefflexu@linux.alibaba.com>,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-cachefs@redhat.com, linux-fsdevel@vger.kernel.org
References: <20220818125038.2247720-1-sunke32@huawei.com>
 <3700079.1661336363@warthog.procyon.org.uk>
 <c6fd70dd-2b0b-ea9f-f0f8-9d727cde2718@linux.alibaba.com>
 <20220825133620.GB2071@kadam>
MIME-Version: 1.0
In-Reply-To: <20220825133620.GB2071@kadam>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Subject: Re: [Linux-cachefs] [PATCH v3] cachefiles: fix error return code in
 cachefiles_ondemand_copen()
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
Cc: linux-fsdevel@vger.kernel.org, linux-cachefs@redhat.com,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Aug 25, 2022 at 04:36:20PM +0300, Dan Carpenter wrote:
> I spent a long time looking at this as well...  It's really inscrutable
> code.  It would be more readable if we just spelled things out in the
> most pedantic way possible:
> 

Yeah, the following code looks much better. Ke, would you mind
sending a version like below instead?

Thanks,
Gao Xiang

> diff --git a/fs/cachefiles/ondemand.c b/fs/cachefiles/ondemand.c
> index 1fee702d5529..7e1586bd5cf3 100644
> --- a/fs/cachefiles/ondemand.c
> +++ b/fs/cachefiles/ondemand.c
> @@ -158,9 +158,13 @@ int cachefiles_ondemand_copen(struct cachefiles_cache *cache, char *args)
>  
>  	/* fail OPEN request if daemon reports an error */
>  	if (size < 0) {
> -		if (!IS_ERR_VALUE(size))
> -			size = -EINVAL;
> -		req->error = size;
> +		if (!IS_ERR_VALUE(size)) {
> +			req->error = -EINVAL;
> +			ret = -EINVAL;
> +		} else {
> +			req->error = size;
> +			ret = 0;
> +		}
>  		goto out;
>  	}
>  
> 
> --
> Linux-cachefs mailing list
> Linux-cachefs@redhat.com
> https://listman.redhat.com/mailman/listinfo/linux-cachefs

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

