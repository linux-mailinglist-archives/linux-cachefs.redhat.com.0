Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 38C82469311
	for <lists+linux-cachefs@lfdr.de>; Mon,  6 Dec 2021 10:57:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1638784671;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=QOoJfncBdlQgVroejTL4hosmeDdwk8Gl2DS3hN8EdVY=;
	b=hmukm5DkyRSbgSmedHHlL7vKLkkfMdpn1wZydn8hT/uXgsfFRyRFzxXoKjO65vFRm7NqdA
	ws/Uo/usML5Rxh2TAmQ3S0WVf5DW74qNDMiIcr3qohxIvfZbLgMYQ9DZ6thhE4bBl7tild
	8vq829TbTyvnfwY4hCLBsLZlNW47jtc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-344-vIWk45qUOfG-KEfQynBSOA-1; Mon, 06 Dec 2021 04:57:50 -0500
X-MC-Unique: vIWk45qUOfG-KEfQynBSOA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5F77910144E1;
	Mon,  6 Dec 2021 09:57:47 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1A08E60843;
	Mon,  6 Dec 2021 09:57:44 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id F3E511809CBA;
	Mon,  6 Dec 2021 09:57:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1B69vc6S018865 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 6 Dec 2021 04:57:38 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 676D561082; Mon,  6 Dec 2021 09:57:38 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.25])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3429F60BF1;
	Mon,  6 Dec 2021 09:57:27 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20211129162907.149445-2-jlayton@kernel.org>
References: <20211129162907.149445-2-jlayton@kernel.org>
	<20211129162907.149445-1-jlayton@kernel.org>
To: Jeff Layton <jlayton@kernel.org>
MIME-Version: 1.0
Date: Mon, 06 Dec 2021 09:57:26 +0000
Message-ID: <1219681.1638784646@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: linux-cachefs@redhat.com
Cc: linux-kernel@vger.kernel.org, linux-cachefs@redhat.com,
	linux-fsdevel@vger.kernel.org, ceph-devel@vger.kernel.org,
	idryomov@gmail.com
Subject: Re: [Linux-cachefs] [PATCH 1/2] ceph: conversion to new fscache API
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-ID: <1219680.1638784646.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Jeff Layton <jlayton@kernel.org> wrote:

>  		if (!(gfp & __GFP_DIRECT_RECLAIM) || !(gfp & __GFP_FS))

There's a function for the first part of this:

		if (!gfpflags_allow_blocking(gfp) || !(gfp & __GFP_FS))

> +	fsc->fscache = fscache_acquire_volume(name, NULL, 0);
>  
>  	if (fsc->fscache) {
>  		ent->fscache = fsc->fscache;
>  		list_add_tail(&ent->list, &ceph_fscache_list);

It shouldn't really be necessary to have ceph_fscache_list since
fscache_acquire_volume() will do it's own duplicate check.  I wonder if I
should make fscache_acquire_volume() return -EEXIST or -EBUSY rather than NULL
in such a case and not print an error, but rather leave that to the filesystem
to display.

That would allow you to get rid of the ceph_fscache_entry struct also, I
think.

> +#define FSCACHE_USE_NEW_IO_API

That doesn't exist anymore.

> +		/*
> +		 * If we're truncating up, then we should be able to just update
> +		 * the existing cookie.
> +		 */
> +		if (size > isize)
> +			ceph_fscache_update(inode);

Might look better to say "expanding" rather than "truncating up".

David

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

