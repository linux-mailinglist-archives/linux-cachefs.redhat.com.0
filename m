Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 9F65733EEFF
	for <lists+linux-cachefs@lfdr.de>; Wed, 17 Mar 2021 12:00:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1615978849;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Uszz7HOC4GaI1GW7QUBXsKNLVrBvwdwqUgvZENGJecY=;
	b=EBoMdn3RPl1aZcbthWbr8a/93rJYomNPaTOlKGIu8rWHGyT3RbhSlwvkdibsKr06jg5DiT
	3K4yBWMs8HBw4oEA6GuFrTQPIIn71G0RivcQYR91egbwh+cQM0Y8tOyCqsHcce3JpBBrnz
	32wCRXfb85KvptjImUHyPCCWgKltMus=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-266-H3VEMLCuNjiA-mUV9qIjUA-1; Wed, 17 Mar 2021 07:00:48 -0400
X-MC-Unique: H3VEMLCuNjiA-mUV9qIjUA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A245B57056;
	Wed, 17 Mar 2021 11:00:45 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8CB8075808;
	Wed, 17 Mar 2021 11:00:45 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 694391800216;
	Wed, 17 Mar 2021 11:00:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12H94IBG009787 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 17 Mar 2021 05:04:18 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 180296E418; Wed, 17 Mar 2021 09:04:18 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (ovpn-113-138.rdu2.redhat.com
	[10.10.113.138])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6E43E60CCE;
	Wed, 17 Mar 2021 09:04:10 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <CAHk-=whWoJhGeMn85LOh9FX-5d2-Upzmv1m2ZmYxvD31TKpUTA@mail.gmail.com>
References: <CAHk-=whWoJhGeMn85LOh9FX-5d2-Upzmv1m2ZmYxvD31TKpUTA@mail.gmail.com>
	<161539526152.286939.8589700175877370401.stgit@warthog.procyon.org.uk>
	<161539528910.286939.1252328699383291173.stgit@warthog.procyon.org.uk>
	<20210316190707.GD3420@casper.infradead.org>
	<CAHk-=wjSGsRj7xwhSMQ6dAQiz53xA39pOG+XA_WeTgwBBu4uqg@mail.gmail.com>
	<887b9eb7-2764-3659-d0bf-6a034a031618@toxicpanda.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
MIME-Version: 1.0
Date: Wed, 17 Mar 2021 09:04:09 +0000
Message-ID: <31382.1615971849@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: linux-cachefs@redhat.com
X-Mailman-Approved-At: Wed, 17 Mar 2021 07:00:38 -0400
Cc: Dominique Martinet <asmadeus@codewreck.org>, Linux-MM <linux-mm@kvack.org>,
	linux-afs@lists.infradead.org, CIFS <linux-cifs@vger.kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	Christoph Hellwig <hch@lst.de>, linux-cachefs@redhat.com,
	Trond Myklebust <trondmy@hammerspace.com>,
	v9fs-developer@lists.sourceforge.net, Josef Bacik <josef@toxicpanda.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	David Sterba <dsterba@suse.com>, ceph-devel@vger.kernel.org,
	"open list:NFS, 
	SUNRPC, AND..." <linux-nfs@vger.kernel.org>, Chris Mason <clm@fb.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Steve French <sfrench@samba.org>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	Anna Schumaker <anna.schumaker@netapp.com>
Subject: Re: [Linux-cachefs] [PATCH v4 02/28] mm: Add an unlock function for
	PG_private_2/PG_fscache
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-ID: <31381.1615971849.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Linus Torvalds <torvalds@linux-foundation.org> wrote:

> And as far as I can tell, fscache doesn't want that PG_private_2 bit
> to interact with the random VM lifetime or migration rules either, and
> should rely entirely on the page count. David?

It's slightly complicated for fscache as there are two separate pieces of code
involved:

 (1) For the old fscache code that I'm trying to phase out, it does not take a
     ref when PG_fscache is taken (probably incorrectly), relying instead on
     releasepage, etc. getting called to strip the PG_fscache bit.  PG_fscache
     is held for the lifetime of the page, indicating that fscache knows about
     it and might access it at any time (to write to the cache in the
     background for example or to move pages around in the cache).

     Here PG_fscache should not prevent page eviction or migration and it's
     analogous to PG_private.

     That said, the old fscache code keeps its own radix trees of pages that
     are undergoing write to the cache, so to allow a page to be evicted,
     releasepage and co. have to consult those
     (__fscache_maybe_release_page()).

 (2) For the new netfs lib, PG_fscache is ignored by fscache itself and is
     used by the read helpers.  The helpers simply use it analogously to
     PG_writeback, indicating that there's I/O in progress from this page to
     the cache[*].  It's fine to take a ref here because we know we'll drop it
     shortly.

     Here PG_fscache might prevent page eviction or migration, but only
     because I/O is in progress.  If an increment on the page refcount
     suffices, that's fine.

In both cases, releasepage, etc. look at PG_fscache and decide whether to wait
or not (releasepage may tell the caller to skip the page if PG_fscache is
set).

[*] Willy suggested using PG_writeback to cover both write to the server and
write to the cache, and getting rid of PG_fscache entirely, but that would
require extra mechanisms.  There are three cases:

 (a) We might be writing to only the cache, e.g. because we just read from the
     server.

     Note that this may adversely affect code that does accounting associated
     with PG_writeback because we woudn't actually be writing back a user-made
     change or dealing with a dirty page.  I'm not sure if that's an issue.

 (b) We might writing to both, in which case we can expect both writes to
     finish at different times.

 (c) We might only be writing to the server, e.g. because there's no space in
     the cache or there is no cache.

It's something that might make sense, however, and we can look at in the
future, but for the moment having two separate page flags is simplest.

An additional use of PG_fscache is to prevent a second write to the cache from
being started whilst one is in progress.  I guess that would be taken over by
PG_writeback if we used that.

David

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

