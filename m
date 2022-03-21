Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id DDBEB4E27A8
	for <lists+linux-cachefs@lfdr.de>; Mon, 21 Mar 2022 14:35:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1647869699;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=CtrNb9KXAs1dsDGJhKouYBavtdr7EEN9Pb1dCf8Xrvo=;
	b=Qsy2U8zgmTdkQOW5OjmjIrKaddIxHxS9gSg0kpOdzoKE/hkgYeyybI9PywqUtsnoUktaFa
	qNlPumazdYdOrtiuc+E4NL6fF10qLV8ZmaTPHVpIdX/XxwXprjfZqh3Tk4DhpAbZ7JLmjG
	nC7iVGYmacn059HE8tfK848+GpsDGNU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-625-pWvH_fM1M-W05-Z8rC-jWQ-1; Mon, 21 Mar 2022 09:34:58 -0400
X-MC-Unique: pWvH_fM1M-W05-Z8rC-jWQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C9757801585;
	Mon, 21 Mar 2022 13:34:57 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7F8EF4428F2;
	Mon, 21 Mar 2022 13:34:55 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id D8A1B1947BBF;
	Mon, 21 Mar 2022 13:34:54 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 4E60019451F1 for <linux-cachefs@listman.corp.redhat.com>;
 Mon, 21 Mar 2022 13:34:53 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 2D0191121319; Mon, 21 Mar 2022 13:34:53 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.19])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2B1821121318;
 Mon, 21 Mar 2022 13:34:45 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20220316131723.111553-4-jefflexu@linux.alibaba.com>
References: <20220316131723.111553-4-jefflexu@linux.alibaba.com>
 <20220316131723.111553-1-jefflexu@linux.alibaba.com>
To: Jeffle Xu <jefflexu@linux.alibaba.com>
MIME-Version: 1.0
Date: Mon, 21 Mar 2022 13:34:44 +0000
Message-ID: <1027872.1647869684@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Subject: Re: [Linux-cachefs] [PATCH v5 03/22] cachefiles: introduce
 on-demand read mode
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
Content-ID: <1027871.1647869684.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Jeffle Xu <jefflexu@linux.alibaba.com> wrote:

> Fscache/cachefiles used to serve as a local cache for remote fs. This
> patch, along with the following patches, introduces a new on-demand read
> mode for cachefiles, which can boost the scenario where on-demand read
> semantics is needed, e.g. container image distribution.
> 
> The essential difference between the original mode and on-demand read
> mode is that, in the original mode, when cache miss, netfs itself will
> fetch data from remote, and then write the fetched data into cache file.
> While in on-demand read mode, a user daemon is responsible for fetching
> data and then writing to the cache file.
> 
> This patch only adds the command to enable on-demand read mode. An optional
> parameter to "bind" command is added. On-demand mode will be turned on when
> this optional argument matches "ondemand" exactly, i.e.  "bind
> ondemand". Otherwise cachefiles will keep working in the original mode.

You're not really adding a command, per se.  Also, I would recommend
starting the paragraph with a verb.  How about:

	Make it possible to enable on-demand read mode by adding an
	optional parameter to the "bind" command.  On-demand mode will be
	turned on when this parameter is "ondemand", i.e. "bind ondemand".
	Otherwise cachefiles will work in the original mode.

Also, I'd add a note something like the following:

	This is implemented as a variation on the bind command so that it
	can't be turned on accidentally in /etc/cachefilesd.conf when
	cachefilesd isn't expecting it.	

> The following patches will implement the data plane of on-demand read
> mode.

I would remove this line.  If ondemand mode is not fully implemented in
cachefiles at this point, I would be tempted to move this to the end of the
cachefiles subset of the patchset.  That said, I'm not sure it can be made
to do anything much before that point.

> +#ifdef CONFIG_CACHEFILES_ONDEMAND
> +static inline void cachefiles_ondemand_open(struct cachefiles_cache *cache)
> +{
> +	xa_init_flags(&cache->reqs, XA_FLAGS_ALLOC);
> +	rwlock_init(&cache->reqs_lock);
> +}

Just merge that into the caller.

> +static inline void cachefiles_ondemand_release(struct cachefiles_cache *cache)
> +{
> +	xa_destroy(&cache->reqs);
> +}

Ditto.

> +static inline
> +bool cachefiles_ondemand_daemon_bind(struct cachefiles_cache *cache, char *args)
> +{
> +	if (!strcmp(args, "ondemand")) {
> +		set_bit(CACHEFILES_ONDEMAND_MODE, &cache->flags);
> +		return true;
> +	}
> +
> +	return false;
> +}
> ...
> +	if (!cachefiles_ondemand_daemon_bind(cache, args) && *args) {
> +		pr_err("'bind' command doesn't take an argument\n");
> +		return -EINVAL;
> +	}
> +

I would merge these together, I think, and say something like "Ondemand
mode not enabled in kernel" if CONFIG_CACHEFILES_ONDEMAND=n.

David
--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

