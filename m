Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 71E0949098E
	for <lists+linux-cachefs@lfdr.de>; Mon, 17 Jan 2022 14:30:43 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-537-b25h9gCpP3yhamUyXfG5IA-1; Mon, 17 Jan 2022 08:30:39 -0500
X-MC-Unique: b25h9gCpP3yhamUyXfG5IA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 17E2E1B18BC2;
	Mon, 17 Jan 2022 13:30:36 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 18EC3753F6;
	Mon, 17 Jan 2022 13:30:34 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 288004BB7C;
	Mon, 17 Jan 2022 13:30:29 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20HDUJBN022607 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 17 Jan 2022 08:30:21 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id B124F112132D; Mon, 17 Jan 2022 13:30:19 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AB640112132E
	for <linux-cachefs@redhat.com>; Mon, 17 Jan 2022 13:30:16 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AD255811E7F
	for <linux-cachefs@redhat.com>; Mon, 17 Jan 2022 13:30:16 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34]) by
	relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-160-8v_tQMckPPq2-oUHvAB2pw-1; Mon, 17 Jan 2022 08:30:14 -0500
X-MC-Unique: 8v_tQMckPPq2-oUHvAB2pw-1
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
	Hat Linux)) id 1n9S5F-008EUB-2d; Mon, 17 Jan 2022 13:30:05 +0000
Date: Mon, 17 Jan 2022 13:30:05 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <YeVvXToTxCsMzHZv@casper.infradead.org>
References: <2752208.1642413437@warthog.procyon.org.uk>
	<CAHk-=wjQG5HnwQD98z8de1EvRzDnebZxh=gQUVTKCn0DOp7PQw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHk-=wjQG5HnwQD98z8de1EvRzDnebZxh=gQUVTKCn0DOp7PQw@mail.gmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: linux-cachefs@redhat.com
Cc: Latchesar Ionkov <lucho@ionkov.net>, Peter Zijlstra <peterz@infradead.org>,
	Dominique Martinet <asmadeus@codewreck.org>, Linux-MM <linux-mm@kvack.org>,
	Marc Dionne <marc.dionne@auristor.com>, linux-afs@lists.infradead.org,
	Shyam Prasad N <nspmangalore@gmail.com>,
	CIFS <linux-cifs@vger.kernel.org>, linux-cachefs@redhat.com,
	Trond Myklebust <trondmy@hammerspace.com>,
	v9fs-developer@lists.sourceforge.net,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	ceph-devel@vger.kernel.org, "open list:NFS, SUNRPC,
	AND..." <linux-nfs@vger.kernel.org>, Jeff Layton <jlayton@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Steve French <sfrench@samba.org>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	Omar Sandoval <osandov@osandov.com>,
	Anna Schumaker <anna.schumaker@netapp.com>
Subject: Re: [Linux-cachefs] Out of order read() completion and buffer
 filling beyond returned amount
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
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Jan 17, 2022 at 12:19:29PM +0200, Linus Torvalds wrote:
> On Mon, Jan 17, 2022 at 11:57 AM David Howells <dhowells@redhat.com> wrote:
> >
> > Do you have an opinion on whether it's permissible for a filesystem to write
> > into the read() buffer beyond the amount it claims to return, though still
> > within the specified size of the buffer?
> 
> I'm pretty sure that would seriously violate POSIX in the general
> case, and maybe even break some programs that do fancy buffer
> management (ie I could imagine some circular buffer thing that expects
> any "unwritten" ('unread'?) parts to stay with the old contents)
> 
> That said, that's for generic 'read()' cases for things like tty's or
> pipes etc that can return partial reads in the first place.
> 
> If it's a regular file, then any partial read *already* violates
> POSIX, and nobody sane would do any such buffer management because
> it's supposed to be a 'can't happen' thing.
> 
> And since you mention DIO, that's doubly true, and is already outside
> basic POSIX, and has already violated things like "all or nothing"
> rules for visibility of writes-vs-reads (which admittedly most Linux
> filesystems have violated even outside of DIO, since the strictest
> reading of the rules are incredibly nasty anyway). But filesystems
> like XFS which took some of the strict rules more seriously already
> ignored them for DIO, afaik.

I think for DIO, you're sacrificing the entire buffer with any filesystem.
If the underlying file is split across multiple drives, or is even
just fragmented on a single drive, we'll submit multiple BIOs which
will complete independently (even for SCSI which writes sequentially;
never mind NVMe which can DMA blocks asynchronously).  It might be
more apparent in a networking situation where errors are more common,
but it's always been a possibility since Linux introduced DIO.

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

