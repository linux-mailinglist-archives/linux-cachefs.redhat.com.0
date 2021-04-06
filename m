Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id CFB53354FA3
	for <lists+linux-cachefs@lfdr.de>; Tue,  6 Apr 2021 11:12:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1617700361;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=vU9tHVPglS+NuFvDI/3tFlbWRGsMo8G+J1gfcDJGIBI=;
	b=JMWcYY9JCL+Z2+qgji8A5hsPREjlWYjO7j64o+RrLtuIPrWvehLZxjieuu4Fq7nJsRis+4
	tjmADu3kfxncsjdWt0+GLHyaIWiaxu0RCuNU9qZTfvTiPZRH0tD/dDWEP1YJzOsbP23iE1
	Aoc+mKadKkwU6uv/90o+j4I/SC5I0HQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-19-9mqfEgoqPXyPzNLDW5oeTA-1; Tue, 06 Apr 2021 05:12:40 -0400
X-MC-Unique: 9mqfEgoqPXyPzNLDW5oeTA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 26296839A42;
	Tue,  6 Apr 2021 09:12:38 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9C53E610AE;
	Tue,  6 Apr 2021 09:12:36 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 96F201809C83;
	Tue,  6 Apr 2021 09:12:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1369CVFI013628 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 6 Apr 2021 05:12:31 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 934926E6FB; Tue,  6 Apr 2021 09:12:31 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (ovpn-112-58.rdu2.redhat.com
	[10.10.112.58])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CEC5D59449;
	Tue,  6 Apr 2021 09:12:26 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20210405164603.281189-1-brauner@kernel.org>
References: <20210405164603.281189-1-brauner@kernel.org>
To: Christian Brauner <brauner@kernel.org>
MIME-Version: 1.0
Date: Tue, 06 Apr 2021 10:12:25 +0100
Message-ID: <107463.1617700345@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: linux-cachefs@redhat.com
Cc: linux-fsdevel@vger.kernel.org,
	Christian Brauner <christian.brauner@ubuntu.com>,
	linux-cachefs@redhat.com, Amir Goldstein <amir73il@gmail.com>
Subject: Re: [Linux-cachefs] [PATCH] cachefiles: use private mounts in
	cache->mnt
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-cachefs>, 
	<mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/linux-cachefs>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Sender: linux-cachefs-bounces@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-ID: <107462.1617700345.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Christian Brauner <brauner@kernel.org> wrote:

> Besides that - and probably irrelevant from the perspective of a
> cachefiles developer - it also makes things simpler for a variety of
> other vfs features. One concrete example is fanotify.

What about cachefilesd?  That walks over the tree regularly, stats things and
maybe deletes things.  Should that be in a private mount/namespace too?

> This seems a rather desirable property as the underlying path can't e.g.
> suddenly go from read-write to read-only and in general it means that
> cachefiles is always in full control of the underlying mount after the
> user has allowed it to be used as a cache.

That's not entirely true, but I guess that emergency R/O conversion isn't a
case that's worrisome - and, in any case, only affects the superblock.

>  	ret = -EINVAL;
> -	if (mnt_user_ns(path.mnt) != &init_user_ns) {
> +	if (mnt_user_ns(cache->mnt) != &init_user_ns) {
>  		pr_warn("File cache on idmapped mounts not supported");
>  		goto error_unsupported;
>  	}

Is it worth doing this check before calling clone_private_mount()?

> +	cache_path = path;
> +	cache_path.mnt = cache->mnt;

Seems pointless to copy all of path into cache_path rather than just
path.dentry.

Apart from that, looks okay.

David

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

