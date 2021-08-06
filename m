Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 5F6963E2D24
	for <lists+linux-cachefs@lfdr.de>; Fri,  6 Aug 2021 17:05:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1628262326;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=iuYMu/mbkk8hbwoYvxPiset3NADTS+31RtXSZbDq/5E=;
	b=eyHvV4HoiCJY+K8pas2bcWwIlxHRXC3wemIvpEuJNc2liuIX7Zgnc2/9xyAmEbxXUjQoeL
	RXKWyhQH4CVhaaWJODln8yOUxauEhTUH2/FkpU4lqYLKwI1csPSOfFG3itOFnsWDfK4FfY
	lRKMgDw1lZRB/sRUE8e15vdMm+xODtw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-93-2s9LI3IVPOyTQ4glKkaT7Q-1; Fri, 06 Aug 2021 11:05:23 -0400
X-MC-Unique: 2s9LI3IVPOyTQ4glKkaT7Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 074CC87D541;
	Fri,  6 Aug 2021 15:05:13 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3A31C5D6A1;
	Fri,  6 Aug 2021 15:05:12 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 427C0180BAB0;
	Fri,  6 Aug 2021 15:05:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 176F55Ke014469 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 6 Aug 2021 11:05:05 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 707F31036D38; Fri,  6 Aug 2021 15:05:05 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.22.32.7])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CBEEA10640E8;
	Fri,  6 Aug 2021 15:04:54 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <YQ1Ei9lv9ov2AheS@casper.infradead.org>
References: <YQ1Ei9lv9ov2AheS@casper.infradead.org>
	<YQxh/G0xGl3GtC8y@casper.infradead.org>
	<YQv+iwmhhZJ+/ndc@casper.infradead.org>
	<YQvpDP/tdkG4MMGs@casper.infradead.org>
	<YQvbiCubotHz6cN7@casper.infradead.org>
	<1017390.1628158757@warthog.procyon.org.uk>
	<1170464.1628168823@warthog.procyon.org.uk>
	<1186271.1628174281@warthog.procyon.org.uk>
	<1219713.1628181333@warthog.procyon.org.uk>
	<CAHk-=wjyEk9EuYgE3nBnRCRd_AmRYVOGACEjt0X33QnORd5-ig@mail.gmail.com>
	<1302671.1628257357@warthog.procyon.org.uk>
To: Matthew Wilcox <willy@infradead.org>
MIME-Version: 1.0
Date: Fri, 06 Aug 2021 16:04:53 +0100
Message-ID: <1306894.1628262293@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: linux-cachefs@redhat.com
Cc: Shyam Prasad N <nspmangalore@gmail.com>, Steve French <sfrench@samba.org>,
	"open list:NFS, SUNRPC, AND..." <linux-nfs@vger.kernel.org>,
	linux-afs@lists.infradead.org, Miklos Szeredi <miklos@szeredi.hu>,
	CIFS <linux-cifs@vger.kernel.org>,
	Dominique Martinet <asmadeus@codewreck.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Trond Myklebust <trond.myklebust@hammerspace.com>,
	Linux-MM <linux-mm@kvack.org>, linux-cachefs@redhat.com,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Anna Schumaker <anna.schumaker@netapp.com>,
	devel@lists.orangefs.org, Mike Marshall <hubcap@omnibond.com>
Subject: Re: [Linux-cachefs] Canvassing for network filesystem write size vs
	page size
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-ID: <1306893.1628262293.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Matthew Wilcox <willy@infradead.org> wrote:

> No, that is very much not the same thing.  Look at what NFS does, like
> Linus said.  Consider this test program:
> 
> 	fd = open();
> 	lseek(fd, 5, SEEK_SET);
> 	write(fd, buf, 3);
> 	write(fd, buf2, 10);
> 	write(fd, buf3, 2);
> 	close(fd);

Yes, I get that.  I can do that when there isn't a local cache or content
encryption.

Note that, currently, if the pages (or cache blocks) being read/modified are
beyond the EOF at the point when the file is opened, truncated down or last
subject to 3rd-party invalidation, I don't go to the server at all.

> > But that kind of screws with local caching.  The local cache might need to
> > track the missing bits, and we are likely to be using blocks larger than a
> > page.
> 
> There's nothing to cache.  Pages which are !Uptodate aren't going to get
> locally cached.

Eh?  Of course there is.  You've just written some data.  That need to get
copied to the cache as well as the server if that file is supposed to be being
cached (for filesystems that support local caching of files open for writing,
which AFS does).

> > Basically, there are a lot of scenarios where not having fully populated
> > pages sucks.  And for streaming writes, wouldn't it be better if you used
> > DIO writes?
> 
> DIO can't do sub-512-byte writes.

Yes it can - and it works for my AFS client at least with the patches in my
fscache-iter-2 branch.  This is mainly a restriction for block storage devices
we're doing DMA to - but we're not doing direct DMA to block storage devices
typically when talking to a network filesystem.

For AFS, at least, I can just make one big FetchData/StoreData RPC that
reads/writes the entire DIO request in a single op; for other filesystems
(NFS, ceph for example), it needs breaking up into a sequence of RPCs, but
there's no particular reason that I know of that requires it to be 512-byte
aligned on any of these.

Things get more interesting if you're doing DIO to a content-encrypted file
because the block size may be 4096 or even a lot larger - in which case we
would have to do local RMW to handle misaligned writes, but it presents no
particular difficulty.

> You might not be trying to do anything for block filesystems, but we
> should think about what makes sense for block filesystems as well as
> network filesystems.

Whilst that's a good principle, they have very different characteristics that
might make that difficult.

David

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

