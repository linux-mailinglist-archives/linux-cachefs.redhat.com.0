Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 354C0492104
	for <lists+linux-cachefs@lfdr.de>; Tue, 18 Jan 2022 09:12:32 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-501-EWhIbOVCPlm_-L4tkjPrUw-1; Tue, 18 Jan 2022 03:12:29 -0500
X-MC-Unique: EWhIbOVCPlm_-L4tkjPrUw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2A2EA83DD20;
	Tue, 18 Jan 2022 08:12:27 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9C7474EC89;
	Tue, 18 Jan 2022 08:12:25 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BF1441809CB8;
	Tue, 18 Jan 2022 08:12:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
	[10.11.54.9])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20I83m68016488 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 18 Jan 2022 03:03:49 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id CF3C7492D1E; Tue, 18 Jan 2022 08:03:48 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CAE5C492D1D
	for <linux-cachefs@redhat.com>; Tue, 18 Jan 2022 08:03:48 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A6FEF3C1D8C4
	for <linux-cachefs@redhat.com>; Tue, 18 Jan 2022 08:03:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-526-byR0ES3FPGiuCr8r-dqpSA-1; Tue, 18 Jan 2022 03:03:47 -0500
X-MC-Unique: byR0ES3FPGiuCr8r-dqpSA-1
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red
	Hat Linux)) id 1n9iri-000afR-VI; Tue, 18 Jan 2022 07:25:14 +0000
Date: Mon, 17 Jan 2022 23:25:14 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <YeZrWoQY/3dKZHfT@infradead.org>
References: <2752208.1642413437@warthog.procyon.org.uk>
	<CAHk-=wjQG5HnwQD98z8de1EvRzDnebZxh=gQUVTKCn0DOp7PQw@mail.gmail.com>
	<YeVvXToTxCsMzHZv@casper.infradead.org>
MIME-Version: 1.0
In-Reply-To: <YeVvXToTxCsMzHZv@casper.infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
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
	Linus Torvalds <torvalds@linux-foundation.org>,
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Jan 17, 2022 at 01:30:05PM +0000, Matthew Wilcox wrote:
> I think for DIO, you're sacrificing the entire buffer with any filesystem.
> If the underlying file is split across multiple drives, or is even
> just fragmented on a single drive, we'll submit multiple BIOs which
> will complete independently (even for SCSI which writes sequentially;
> never mind NVMe which can DMA blocks asynchronously).  It might be
> more apparent in a networking situation where errors are more common,
> but it's always been a possibility since Linux introduced DIO.

Yes.  Probably because of that we also never allow short reads or writes
due to I/O errrors but always fail the whole I/O.

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

