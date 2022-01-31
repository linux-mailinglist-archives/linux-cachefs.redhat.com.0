Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id CA64B4A4A98
	for <lists+linux-cachefs@lfdr.de>; Mon, 31 Jan 2022 16:32:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1643643138;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=D0khKZCPo5dq9s8fP7Fy+cToWkivDyD20Dj1iYB+BsA=;
	b=YDtiOlVlKagIU2mpC04NnUxZ2iITCcV7bJxc7yjfdmtYAGVKGWHIg67HxWE+o2ti1i1tux
	yqi35RJm/i4i6/1lp9B5R8Eh1hoc9tWSFCr5LE/DdHgIFGm2EFfmUAAHeLMZGlFytnxbHH
	1417k+r5ypp3wNnf13ocqwc6f8d9t7o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-354-ID1upRPUMBCtmmUwmdOkgA-1; Mon, 31 Jan 2022 10:32:15 -0500
X-MC-Unique: ID1upRPUMBCtmmUwmdOkgA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0E2F48143F2;
	Mon, 31 Jan 2022 15:32:14 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CD9907B9D1;
	Mon, 31 Jan 2022 15:32:13 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6B3E21809CB8;
	Mon, 31 Jan 2022 15:32:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20VFWB2T008315 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 31 Jan 2022 10:32:11 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 538E084A10; Mon, 31 Jan 2022 15:32:11 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.26])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 53D2884D04;
	Mon, 31 Jan 2022 15:32:09 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <CAOQ4uxiorvXhhJbCsGo-B7aBX0BbSYp7wUHmYS1e1xxJ4dpF3w@mail.gmail.com>
References: <CAOQ4uxiorvXhhJbCsGo-B7aBX0BbSYp7wUHmYS1e1xxJ4dpF3w@mail.gmail.com>
	<164364196407.1476539.8450117784231043601.stgit@warthog.procyon.org.uk>
	<164364197646.1476539.3635698398603811895.stgit@warthog.procyon.org.uk>
To: Amir Goldstein <amir73il@gmail.com>
MIME-Version: 1.0
Date: Mon, 31 Jan 2022 15:32:08 +0000
Message-ID: <1531209.1643643128@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: linux-cachefs@redhat.com
Cc: Christoph Hellwig <hch@infradead.org>, Miklos Szeredi <miklos@szeredi.hu>,
	Jeff Layton <jlayton@kernel.org>,
	overlayfs <linux-unionfs@vger.kernel.org>,
	linux-kernel <linux-kernel@vger.kernel.org>, linux-cachefs@redhat.com,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [Linux-cachefs] [PATCH 1/5] vfs, overlayfs,
	cachefiles: Turn I_OVL_INUSE into something generic
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
Content-ID: <1531205.1643643128.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Amir Goldstein <amir73il@gmail.com> wrote:

> Please leave ovl_* as wrappers instead of changing super.c.

Do you want them turning into inline functions?

David

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

