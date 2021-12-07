Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A96F46C143
	for <lists+linux-cachefs@lfdr.de>; Tue,  7 Dec 2021 18:02:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1638896555;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=hv6JJYXwl1YC4wi9G4aaoh/S1HxAuXg59pQcT8EbsWE=;
	b=aTTn1Gym7XKnzw1/qqJUkaRp2YbWEfwRfhAJZ7j6NDmE3U4r0JpU4Z+VkotK+AnJKo0fZu
	+727D79QWEmk7XFKpdsua7bjulnREbMIJOpixBQqHACMsKPTFd/7CgYXLwQw2LdQzKNPJR
	B6Lvzthh1zJdWGXPiXGus/Wr/lg8T78=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-245-K_mve6uwOjSInhrUWwmsMA-1; Tue, 07 Dec 2021 12:02:31 -0500
X-MC-Unique: K_mve6uwOjSInhrUWwmsMA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E8440100D680;
	Tue,  7 Dec 2021 17:02:28 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ACC8D5C23A;
	Tue,  7 Dec 2021 17:02:27 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7651F4BB7C;
	Tue,  7 Dec 2021 17:02:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1B7H2NhS032056 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 7 Dec 2021 12:02:23 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 1C92671C89; Tue,  7 Dec 2021 17:02:23 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.25])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 54470177C0;
	Tue,  7 Dec 2021 17:02:21 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20211204220350.633811-1-arnd@kernel.org>
References: <20211204220350.633811-1-arnd@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
MIME-Version: 1.0
Date: Tue, 07 Dec 2021 17:02:20 +0000
Message-ID: <1878025.1638896540@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: linux-cachefs@redhat.com
Cc: Nathan Chancellor <nathan@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Jeff Layton <jlayton@kernel.org>, llvm@lists.linux.dev,
	Nick Desaulniers <ndesaulniers@google.com>,
	linux-kernel@vger.kernel.org, linux-cachefs@redhat.com
Subject: Re: [Linux-cachefs] [PATCH] cachefiles: fix
	__cachefiles_prepare_write() error handling
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-ID: <1878024.1638896540.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Arnd Bergmann <arnd@kernel.org> wrote:

>  	pos = cachefiles_inject_remove_error();
> -	if (pos == 0)
> -		ret = vfs_fallocate(file, FALLOC_FL_PUNCH_HOLE | FALLOC_FL_KEEP_SIZE,
> -				    *_start, *_len);
> +	if (pos != 0)
> +		return 0;
> +
> +	ret = vfs_fallocate(file, FALLOC_FL_PUNCH_HOLE | FALLOC_FL_KEEP_SIZE,
> +			    *_start, *_len);
>  	if (ret < 0) {

The right fix is to use "ret" rather than "pos".  I've fixed this already on
my fscache-rewrite branch.  Hopefully I'll be able to push that over to my
next branch shortly.

David

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

