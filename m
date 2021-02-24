Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id B5055329F9D
	for <lists+linux-cachefs@lfdr.de>; Tue,  2 Mar 2021 13:56:11 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-556-6BCaKxIzMDqk9ymvDPnVEg-1; Tue, 02 Mar 2021 07:56:08 -0500
X-MC-Unique: 6BCaKxIzMDqk9ymvDPnVEg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8D508107ACF2;
	Tue,  2 Mar 2021 12:56:06 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 790CA1C959;
	Tue,  2 Mar 2021 12:56:06 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3B9FB1809C8F;
	Tue,  2 Mar 2021 12:56:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 11OFq4aQ006813 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 24 Feb 2021 10:52:06 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 8AF7F200F444; Wed, 24 Feb 2021 15:52:04 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 840B72010E08
	for <linux-cachefs@redhat.com>; Wed, 24 Feb 2021 15:52:01 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7C73580120A
	for <linux-cachefs@redhat.com>; Wed, 24 Feb 2021 15:52:01 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-409-CITCPYZhM8ScwYmGz8ge2Q-1; Wed, 24 Feb 2021 10:51:46 -0500
X-MC-Unique: CITCPYZhM8ScwYmGz8ge2Q-1
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
	Linux)) id 1lEwRd-009aTu-W2; Wed, 24 Feb 2021 15:51:25 +0000
Date: Wed, 24 Feb 2021 15:51:21 +0000
From: Matthew Wilcox <willy@infradead.org>
To: David Howells <dhowells@redhat.com>
Message-ID: <20210224155121.GQ2858050@casper.infradead.org>
References: <CAH2r5mv=PZk_wn2=b0VQcaom9TEw1MGLz+qB_Ktxxm2bnV9Nig@mail.gmail.com>
	<161340385320.1303470.2392622971006879777.stgit@warthog.procyon.org.uk>
	<9e49f96cd80eaf9c8ed267a7fbbcb4c6467ee790.camel@redhat.com>
	<CAH2r5mvPLivjuE=cbijzGSHOvx-hkWSWbcxpoBnJX-BR9pBskQ@mail.gmail.com>
	<20210216021015.GH2858050@casper.infradead.org>
	<3743319.1614173522@warthog.procyon.org.uk>
MIME-Version: 1.0
In-Reply-To: <3743319.1614173522@warthog.procyon.org.uk>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: linux-cachefs@redhat.com
X-Mailman-Approved-At: Tue, 02 Mar 2021 07:55:59 -0500
Cc: CIFS <linux-cifs@vger.kernel.org>, linux-nfs <linux-nfs@vger.kernel.org>,
	William Kucharski <william.kucharski@oracle.com>,
	linux-mm <linux-mm@kvack.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Dominique Martinet <asmadeus@codewreck.org>,
	LKML <linux-kernel@vger.kernel.org>,
	linux-afs@lists.infradead.org, Steve French <sfrench@samba.org>,
	Steve French <smfrench@gmail.com>, linux-cachefs@redhat.com,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Trond Myklebust <trondmy@hammerspace.com>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
	Christoph Hellwig <hch@lst.de>, Anna Schumaker <anna.schumaker@netapp.com>
Subject: Re: [Linux-cachefs] [PATCH 00/33] Network fs helper library &
 fscache kiocb API [ver #3]
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Feb 24, 2021 at 01:32:02PM +0000, David Howells wrote:
> Steve French <smfrench@gmail.com> wrote:
> 
> > This (readahead behavior improvements in Linux, on single large file
> > sequential read workloads like cp or grep) gets particularly interesting
> > with SMB3 as multichannel becomes more common.  With one channel having one
> > readahead request pending on the network is suboptimal - but not as bad as
> > when multichannel is negotiated. Interestingly in most cases two network
> > connections to the same server (different TCP sockets,but the same mount,
> > even in cases where only network adapter) can achieve better performance -
> > but still significantly lags Windows (and probably other clients) as in
> > Linux we don't keep multiple I/Os in flight at one time (unless different
> > files are being read at the same time by different threads).
> 
> I think it should be relatively straightforward to make the netfs_readahead()
> function generate multiple read requests.  If I wasn't handed sufficient pages
> by the VM upfront to do two or more read requests, I would need to do extra
> expansion.  There are a couple of ways this could be done:

I don't think this is a job for netfs_readahead().  We can get into a
similar situation with SSDs or RAID arrays where ideally we would have
several outstanding readahead requests.

If your drive is connected through a 1Gbps link (eg PCIe gen 1 x1) and
has a latency of 10ms seek time, with one outstanding read, each read
needs to be 12.5MB in size in order to saturate the bus.  If the device
supports 128 outstanding commands, each read need only be 100kB.

We need the core readahead code to handle this situation.  My suggestion
for doing this is to send off an extra readahead request every time we
hit a !Uptodate page.  It looks something like this (assuming the app
is processing the data fast and always hits the !Uptodate case) ...

1. hit 0,
	set readahead size to 64kB,
	mark 32kB as Readahead, send read for 0-64kB
	wait for 0-64kB to complete
2. hit 32kB (Readahead), no reads outstanding
	inc readahead size to 128kB,
	mark 128kB as Readahead, send read for 64k-192kB
3. hit 64kB (!Uptodate), one read outstanding
	mark 256kB as Readahead, send read for 192-320kB
	mark 384kB as Readahead, send read for 320-448kB
	wait for 64-192kB to complete
4. hit 128kB (Readahead), two reads outstanding
	inc readahead size to 256kB,
	mark 576kB as Readahead, send read for 448-704kB
5. hit 192kB (!Uptodate), three reads outstanding
	mark 832kB as Readahead, send read for 704-960kB
	mark 1088kB as Readahead, send read for 960-1216kB
	wait for 192-320kB to complete
6. hit 256kB (Readahead), four reads outstanding
	mark 1344kB as Readahead, send read for 1216-1472kB
7. hit 320kB (!Uptodate), five reads outstanding
	mark 1600kB as Readahead, send read for 1472-1728kB
	mark 1856kB as Readahead, send read for 1728-1984kB
	wait for 320-448kB to complete
8. hit 384kB (Readahead), five reads outstanding
	mark 2112kB as Readahead, send read for 1984-2240kB
9. hit 448kB (!Uptodate), six reads outstanding
	mark 2368kB as Readahead, send read for 2240-2496kB
	mark 2624kB as Readahead, send read for 2496-2752kB
	wait for 448-704kB to complete
10. hit 576kB (Readahead), seven reads outstanding
	mark 2880kB as Readahead, send read for 2752-3008kB

...

Once we stop hitting !Uptodate pages, we'll maintain the number of pages
marked as Readahead, and thus keep the number of readahead requests
at the level it determined was necessary to keep the link saturated.
I think we may need to put a parallelism cap in the bdi so that a device
which is just slow instead of at the end of a long fat pipe doesn't get
overwhelmed with requests.

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

