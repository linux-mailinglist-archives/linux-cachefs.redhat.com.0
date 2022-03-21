Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C4ECA4E292E
	for <lists+linux-cachefs@lfdr.de>; Mon, 21 Mar 2022 15:01:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1647871310;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=XdKJ9adnCemxCUjWAne/vYtKJuFU3GRb9xEBMbKJR7Q=;
	b=N+ZdR9jFM+6DlzN3Nc5fBO951ysQxt4gixO+bVE+XtxbAQkLucAsWrRp1RSk14iBLYjewu
	QbfcxlwG8vQVy72bhREG1QTYr7cqsPkFtKA6cIa/5GCerK1tIfeVmMfhUvbQaArTsadSrH
	7+S/6PjUXxpCkq1zbpQdayaov/WwcT0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-466-fItPSQe1Nf6ouFnVOoVyeA-1; Mon, 21 Mar 2022 10:01:47 -0400
X-MC-Unique: fItPSQe1Nf6ouFnVOoVyeA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 921DB28035EF;
	Mon, 21 Mar 2022 14:01:46 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8694E442CD0;
	Mon, 21 Mar 2022 14:01:46 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 57B291947BBE;
	Mon, 21 Mar 2022 14:01:46 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id ACBD119451ED for <linux-cachefs@listman.corp.redhat.com>;
 Mon, 21 Mar 2022 14:01:45 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 6C2E42166B46; Mon, 21 Mar 2022 14:01:45 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.19])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E5DB92166B2D;
 Mon, 21 Mar 2022 14:01:34 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20220316131723.111553-5-jefflexu@linux.alibaba.com>
References: <20220316131723.111553-5-jefflexu@linux.alibaba.com>
 <20220316131723.111553-1-jefflexu@linux.alibaba.com>
To: Jeffle Xu <jefflexu@linux.alibaba.com>
MIME-Version: 1.0
Date: Mon, 21 Mar 2022 14:01:34 +0000
Message-ID: <1029248.1647871294@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Subject: Re: [Linux-cachefs] [PATCH v5 04/22] cachefiles: notify user daemon
 with anon_fd when looking up cookie
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
Cc: linux-erofs@lists.ozlabs.org, chao@kernel.org, tao.peng@linux.alibaba.com,
 willy@infradead.org, linux-kernel@vger.kernel.org, joseph.qi@linux.alibaba.com,
 linux-cachefs@redhat.com, bo.liu@linux.alibaba.com, gregkh@linuxfoundation.org,
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
Content-ID: <1029247.1647871294.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Jeffle Xu <jefflexu@linux.alibaba.com> wrote:

> +	read_lock(&cache->reqs_lock);
> +
> +	/* recheck dead state under lock */
> +	if (test_bit(CACHEFILES_DEAD, &cache->flags)) {
> +		read_unlock(&cache->reqs_lock);
> +		ret = -EIO;
> +		goto out;
> +	}
> +
> +	xa_lock(xa);
> +	ret = __xa_alloc(xa, &id, req, xa_limit_32b, GFP_KERNEL);

You're holding a spinlock.  You can't use GFP_KERNEL.

> +static int cachefiles_ondemand_cinit(struct cachefiles_cache *cache, char *args)
> +{
> ...
> +	tmp = kstrdup(args, GFP_KERNEL);

No need to copy the string.  The caller already did that and added a NUL for
good measure.

I would probably move most of the functions added in this patch to
fs/cachefiles/ondemand.c.

David
--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

