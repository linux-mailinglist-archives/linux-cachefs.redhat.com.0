Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C32A7436E45
	for <lists+linux-cachefs@lfdr.de>; Fri, 22 Oct 2021 01:24:01 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-585-Qy_RB1U-PVW6qi9NbB_rjQ-1; Thu, 21 Oct 2021 19:23:57 -0400
X-MC-Unique: Qy_RB1U-PVW6qi9NbB_rjQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 93A74802B7E;
	Thu, 21 Oct 2021 23:23:55 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 59FFD5F4E9;
	Thu, 21 Oct 2021 23:23:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E207D1806D04;
	Thu, 21 Oct 2021 23:23:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
	[10.11.54.1])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19LNNo4E013817 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 21 Oct 2021 19:23:50 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id DDBC340CFD11; Thu, 21 Oct 2021 23:23:49 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D8B0340CFD08
	for <linux-cachefs@redhat.com>; Thu, 21 Oct 2021 23:23:49 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BF4C318A01A0
	for <linux-cachefs@redhat.com>; Thu, 21 Oct 2021 23:23:49 +0000 (UTC)
Received: from nautica.notk.org (nautica.notk.org [91.121.71.147]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-163-W2s3K82TPFKsG7F7P7ut0A-1; Thu, 21 Oct 2021 19:23:47 -0400
X-MC-Unique: W2s3K82TPFKsG7F7P7ut0A-1
Received: by nautica.notk.org (Postfix, from userid 108)
	id 2E665C024; Fri, 22 Oct 2021 01:23:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on nautica.notk.org
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=UNPARSEABLE_RELAY
	autolearn=unavailable version=3.3.2
Received: from odin.codewreck.org (localhost [127.0.0.1])
	by nautica.notk.org (Postfix) with ESMTPS id A0916C009;
	Fri, 22 Oct 2021 01:23:34 +0200 (CEST)
Received: from localhost (odin.codewreck.org [local])
	by odin.codewreck.org (OpenSMTPD) with ESMTPA id f1866e14;
	Thu, 21 Oct 2021 23:23:30 +0000 (UTC)
Date: Fri, 22 Oct 2021 08:23:15 +0900
From: Dominique Martinet <asmadeus@codewreck.org>
To: Steve French <smfrench@gmail.com>
Message-ID: <YXH2Y7+coD5sgEDG@codewreck.org>
References: <163456861570.2614702.14754548462706508617.stgit@warthog.procyon.org.uk>
	<YXHntB2O0ACr0pbz@relinquished.localdomain>
	<CAH2r5msO7-QCXv6JQj2Tado9ZoWAHRkgq6-En18PeKSXFDdBLw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAH2r5msO7-QCXv6JQj2Tado9ZoWAHRkgq6-En18PeKSXFDdBLw@mail.gmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
X-loop: linux-cachefs@redhat.com
Cc: Latchesar Ionkov <lucho@ionkov.net>, linux-mm <linux-mm@kvack.org>,
	Marc Dionne <marc.dionne@auristor.com>, linux-afs@lists.infradead.org,
	Shyam Prasad N <nspmangalore@gmail.com>, CIFS <linux-cifs@vger.kernel.org>,
	Matthew Wilcox <willy@infradead.org>, linux-cachefs@redhat.com,
	Trond Myklebust <trondmy@hammerspace.com>,
	v9fs-developer@lists.sourceforge.net, Ilya Dryomov <idryomov@gmail.com>,
	Kent Overstreet <kent.overstreet@gmail.com>,
	Al Viro <viro@zeniv.linux.org.uk>, ceph-devel <ceph-devel@vger.kernel.org>,
	Trond Myklebust <trond.myklebust@hammerspace.com>,
	linux-nfs <linux-nfs@vger.kernel.org>, Jeff Layton <jlayton@kernel.org>,
	LKML <linux-kernel@vger.kernel.org>, Steve French <sfrench@samba.org>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	Omar Sandoval <osandov@osandov.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Anna Schumaker <anna.schumaker@netapp.com>
Subject: Re: [Linux-cachefs] [PATCH 00/67] fscache: Rewrite index API and
	management system
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
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Steve French wrote on Thu, Oct 21, 2021 at 06:15:49PM -0500:
> Have changes been made to O_TMPFILE?  It is problematic for network filesystems
> because it is not an atomic operation, and would be great if it were possible
> to create a tmpfile and open it atomically (at the file system level).
> 
> Currently it results in creating a tmpfile (which results in
> opencreate then close)
> immediately followed by reopening the tmpfile which is somewhat counter to
> the whole idea of a tmpfile (ie that it is deleted when closed) since
> the syscall results
> in two opens ie open(create)/close/open/close

That depends on the filesystem, e.g. 9p open returns the opened fid so
our semantic could be closer to that of a local filesystem (could
because I didn't test recently and don't recall how it was handled, I
think it was fixed as I remember it being a problem at some point...)

The main problem with network filesystem and "open closed files" is:
what should the server do if the client disconnects? Will the client
come back and try to access that file again? Did the client crash
completely and should the file be deleted? The server has no way of
knowing.
It's the same logic as unlinking an open file, leading to all sort of
"silly renames" that are most famous for nfs (.nfsxxxx files that the
servers have been taught to just delete if they haven't been accessed
for long enough...)

I'm not sure we can have a generic solution for that unfortunately...

(9P is "easy" enough in that the linux client does not attempt to
reconnect ever if the connection has been lost, so we can just really
unlink the file and the server will delete it when the client
disconnects... But if we were to implement a reconnect eventually (I
know of an existing port that does) then this solution is no longer
acceptable)

-- 
Dominique Martinet | Asmadeus

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

