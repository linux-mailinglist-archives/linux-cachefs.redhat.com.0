Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B54F50A1F8
	for <lists+linux-cachefs@lfdr.de>; Thu, 21 Apr 2022 16:18:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1650550699;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=bpDXx5bCC9RYXS+zfIVfkSU2gE9OwW7c4Y+qeL/+Yy0=;
	b=Obk1tmAI+FKzwdWe4hxZZHJniR8KQf1YyowZTBXA0d+gbmaH13SBZeXi9vZtC6xayNnJuW
	0AE3I/zCFniY+K+jdH9CaMgYsglLfmXDqYUzFXUmKxTn04dFEJi+ug/9NrbB/7y2IyfnGI
	mkdqTmry4nqTaMpeGuB4rux2HcgJdOg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-307-0r4jHjJINSKFO6jIjrHj4A-1; Thu, 21 Apr 2022 10:18:14 -0400
X-MC-Unique: 0r4jHjJINSKFO6jIjrHj4A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E461E8FC070;
	Thu, 21 Apr 2022 14:17:45 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A204D40D016F;
	Thu, 21 Apr 2022 14:17:45 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id EE60B194034A;
	Thu, 21 Apr 2022 14:17:43 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id A1C2D19451EF for <linux-cachefs@listman.corp.redhat.com>;
 Thu, 21 Apr 2022 14:17:42 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 5B74040CFD24; Thu, 21 Apr 2022 14:17:42 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.13])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DEAF240CFD22;
 Thu, 21 Apr 2022 14:17:39 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20220415123614.54024-7-jefflexu@linux.alibaba.com>
References: <20220415123614.54024-7-jefflexu@linux.alibaba.com>
 <20220415123614.54024-1-jefflexu@linux.alibaba.com>
To: Jeffle Xu <jefflexu@linux.alibaba.com>
MIME-Version: 1.0
Date: Thu, 21 Apr 2022 15:17:39 +0100
Message-ID: <1445691.1650550659@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
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
Cc: tianzichen@kuaishou.com, linux-erofs@lists.ozlabs.org, chao@kernel.org,
 fannaihao@baidu.com, tao.peng@linux.alibaba.com, willy@infradead.org,
 linux-kernel@vger.kernel.org, joseph.qi@linux.alibaba.com,
 zhangjiachen.jaycee@bytedance.com, linux-cachefs@redhat.com,
 bo.liu@linux.alibaba.com, gregkh@linuxfoundation.org,
 linux-fsdevel@vger.kernel.org, luodaowen.backend@bytedance.com,
 xiang@kernel.org, gerry@linux.alibaba.com, torvalds@linux-foundation.org,
 eguan@linux.alibaba.com
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-ID: <1445690.1650550659.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Jeffle Xu <jefflexu@linux.alibaba.com> wrote:

> +	if (IS_ENABLED(CONFIG_CACHEFILES_ONDEMAND) &&
> +	    !strcmp(args, "ondemand")) {
> +		set_bit(CACHEFILES_ONDEMAND_MODE, &cache->flags);
> +	} else if (*args) {
> +		pr_err("'bind' command doesn't take an argument\n");

The error message isn't true if CONFIG_CACHEFILES_ONDEMAND=y.  It would be
better to say "Invalid argument to the 'bind' command".

> -retry:
>  	/* If the caller asked us to seek for data before doing the read, then
>  	 * we should do that now.  If we find a gap, we fill it with zeros.
>  	 */
> @@ -120,16 +119,6 @@ static int cachefiles_read(struct netfs_cache_resources *cres,
>  			if (read_hole == NETFS_READ_HOLE_FAIL)
>  				goto presubmission_error;
>  
> -			if (read_hole == NETFS_READ_HOLE_ONDEMAND) {
> -				ret = cachefiles_ondemand_read(object, off, len);
> -				if (ret)
> -					goto presubmission_error;
> -
> -				/* fail the read if no progress achieved */
> -				read_hole = NETFS_READ_HOLE_FAIL;
> -				goto retry;
> -			}
> -

Unexplained deletion of newly added code.

David
--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

