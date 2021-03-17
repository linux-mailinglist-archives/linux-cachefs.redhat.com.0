Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 1AC8433EF02
	for <lists+linux-cachefs@lfdr.de>; Wed, 17 Mar 2021 12:00:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1615978852;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=JARdb3gg6q8rmXzHRfZWDUHF7tKZAUSrx+ZtmNGl31k=;
	b=F9O3OksZy8Fy79Ec93X/ZwIjLOo/dq7fGUtCDcaqVUsf6MPSNpyyKdRzA4zy35n9N7RUFT
	f4skxaFHAfASoKMWp6AZElkv+tuU7nJq/1kcok5YKR/Cn6/XBKVkVLis2gjU0AeX1MQf+e
	mgLPLyeaE4IZDbnEMUNG0BIlctEYgWQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-560-T_TUu7aBPISNN4fa7qzHHA-1; Wed, 17 Mar 2021 07:00:50 -0400
X-MC-Unique: T_TUu7aBPISNN4fa7qzHHA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A519157082;
	Wed, 17 Mar 2021 11:00:46 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9366675805;
	Wed, 17 Mar 2021 11:00:46 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7DE6A4A701;
	Wed, 17 Mar 2021 11:00:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12HArkOi021131 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 17 Mar 2021 06:53:46 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 799C3690F4; Wed, 17 Mar 2021 10:53:46 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (ovpn-113-138.rdu2.redhat.com
	[10.10.113.138])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9D8CE6C32F;
	Wed, 17 Mar 2021 10:53:42 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <31382.1615971849@warthog.procyon.org.uk>
References: <31382.1615971849@warthog.procyon.org.uk>
	<CAHk-=whWoJhGeMn85LOh9FX-5d2-Upzmv1m2ZmYxvD31TKpUTA@mail.gmail.com>
	<161539526152.286939.8589700175877370401.stgit@warthog.procyon.org.uk>
	<161539528910.286939.1252328699383291173.stgit@warthog.procyon.org.uk>
	<20210316190707.GD3420@casper.infradead.org>
	<CAHk-=wjSGsRj7xwhSMQ6dAQiz53xA39pOG+XA_WeTgwBBu4uqg@mail.gmail.com>
	<887b9eb7-2764-3659-d0bf-6a034a031618@toxicpanda.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
MIME-Version: 1.0
Date: Wed, 17 Mar 2021 10:53:41 +0000
Message-ID: <38368.1615978421@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 12HArkOi021131
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
Content-ID: <38367.1615978421.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

David Howells <dhowells@redhat.com> wrote:

>  (1) For the old fscache code that I'm trying to phase out, it does not take a
>      ref when PG_fscache is taken (probably incorrectly), relying instead on
>      releasepage, etc. getting called to strip the PG_fscache bit.  PG_fscache
>      is held for the lifetime of the page, indicating that fscache knows about
>      it and might access it at any time (to write to the cache in the
>      background for example or to move pages around in the cache).
> 
>      Here PG_fscache should not prevent page eviction or migration and it's
>      analogous to PG_private.
> 
>      That said, the old fscache code keeps its own radix trees of pages that
>      are undergoing write to the cache, so to allow a page to be evicted,
>      releasepage and co. have to consult those
>      (__fscache_maybe_release_page()).

Note that, ideally, we'll be able to remove the old fscache I/O code in the
next merge window or the one after.

David

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

