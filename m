Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id E0CE7315885
	for <lists+linux-cachefs@lfdr.de>; Tue,  9 Feb 2021 22:25:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1612905939;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=wgnqxLiRvlZHlBk4+4tykU5pY3TZ44ZIcHvZWmiBrlI=;
	b=J0SKJPMDt+1bzVoqzp3VBU6l7tf4yoTqgEhzI1Viz0Dd+QBzOPUh8vKiWDdTpZOYBz9YGG
	L5duNCnnKflQPbg4MY7Daa49VZcsWLNx0rwkbzY/ky0pVxWp0uLdUDsCw/Hj6adfR6hKq4
	rszHxfP9GWZ+eeHh3SQ1k8OkXiKbiCM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-159-xi2BWzuWNpaNmhzQagHDHw-1; Tue, 09 Feb 2021 16:25:37 -0500
X-MC-Unique: xi2BWzuWNpaNmhzQagHDHw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2E12E801965;
	Tue,  9 Feb 2021 21:25:34 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A54355D74B;
	Tue,  9 Feb 2021 21:25:33 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5129A4EA30;
	Tue,  9 Feb 2021 21:25:33 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 119LPUlG019136 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 9 Feb 2021 16:25:30 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id B6322194A4; Tue,  9 Feb 2021 21:25:30 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (ovpn-115-23.rdu2.redhat.com
	[10.10.115.23])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E044519C78;
	Tue,  9 Feb 2021 21:25:23 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20210209202134.GA308988@casper.infradead.org>
References: <20210209202134.GA308988@casper.infradead.org>
	<591237.1612886997@warthog.procyon.org.uk>
	<CAHk-=wj-k86FOqAVQ4ScnBkX3YEKuMzqTEB2vixdHgovJpHc9w@mail.gmail.com>
To: Matthew Wilcox <willy@infradead.org>
MIME-Version: 1.0
Date: Tue, 09 Feb 2021 21:25:23 +0000
Message-ID: <618609.1612905923@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: linux-cachefs@redhat.com
Cc: Steve French <sfrench@samba.org>, "open list:NFS, SUNRPC,
	AND..." <linux-nfs@vger.kernel.org>, CIFS <linux-cifs@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	linux-afs@lists.infradead.org, linux-cachefs@redhat.com,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Trond Myklebust <trondmy@hammerspace.com>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Anna Schumaker <anna.schumaker@netapp.com>,
	Dominique Martinet <asmadeus@codewreck.org>
Subject: Re: [Linux-cachefs] [GIT PULL] fscache: I/O API modernisation and
	netfs helper library
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-cachefs>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Sender: linux-cachefs-bounces@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-ID: <618608.1612905923.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Matthew Wilcox <willy@infradead.org> wrote:

> Yeah, I have trouble with the private2 vs fscache bit too.  I've been
> trying to persuade David that he doesn't actually need an fscache
> bit at all; he can just increment the page's refcount to prevent it
> from being freed while he writes data to the cache.

That's not what the bit is primarily being used for.  It's being used to
prevent the starting of a second write to the cache whilst the first is in
progress and also to prevent modification whilst DMA to the cache is in
progress.  This isn't so obvious in this cut-down patchset, but comes more in
to play with full caching of local writes in my fscache-iter branch.

I can't easily share PG_writeback for this because each bit covers a write to
a different place.  PG_writeback covers the write to the server and PG_fscache
the write to the cache.  These writes may get split up differently and will
most likely finish at different times.

If I have to share PG_writeback, that will mean storing both states for each
page somewhere else and then "OR'ing" them together to drive PG_writeback.

David

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

