Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 332FB32284A
	for <lists+linux-cachefs@lfdr.de>; Tue, 23 Feb 2021 10:59:49 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-216-FJzutzc3PA2d8IX11gdoTA-1; Tue, 23 Feb 2021 04:59:46 -0500
X-MC-Unique: FJzutzc3PA2d8IX11gdoTA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6804769731;
	Tue, 23 Feb 2021 09:59:38 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 58A2D6A254;
	Tue, 23 Feb 2021 09:59:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4414A58083;
	Tue, 23 Feb 2021 09:59:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 11G9GwPW012959 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 16 Feb 2021 04:16:58 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 5E4F21000DBB; Tue, 16 Feb 2021 09:16:58 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5A1981000DB5
	for <linux-cachefs@redhat.com>; Tue, 16 Feb 2021 09:16:56 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 453748919BC
	for <linux-cachefs@redhat.com>; Tue, 16 Feb 2021 09:16:56 +0000 (UTC)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-455-e3PtnM4qMfq23hoqxPKmkg-1; Tue, 16 Feb 2021 04:16:52 -0500
X-MC-Unique: e3PtnM4qMfq23hoqxPKmkg-1
Date: Tue, 16 Feb 2021 10:06:26 +0100
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20210216090626.kqnk726i6f77libt@linutronix.de>
References: <161340385320.1303470.2392622971006879777.stgit@warthog.procyon.org.uk>
	<1376938.1613429183@warthog.procyon.org.uk>
	<20210216084230.GA23669@lst.de>
MIME-Version: 1.0
In-Reply-To: <20210216084230.GA23669@lst.de>
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
X-Mailman-Approved-At: Tue, 23 Feb 2021 04:59:26 -0500
Cc: Steve French <sfrench@samba.org>, linux-nfs@vger.kernel.org,
	linux-cifs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	Dominique Martinet <asmadeus@codewreck.org>,
	Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
	Matthew Wilcox <willy@infradead.org>,
	linux-afs@lists.infradead.org, linux-mm@kvack.org,
	linux-cachefs@redhat.com, Alexander Viro <viro@zeniv.linux.org.uk>,
	Trond Myklebust <trondmy@hammerspace.com>,
	Marc Dionne <marc.dionne@auristor.com>,
	v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
	Anna Schumaker <anna.schumaker@netapp.com>
Subject: Re: [Linux-cachefs] [PATCH 34/33] netfs: Use in_interrupt() not
	in_softirq()
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

On 2021-02-16 09:42:30 [+0100], Christoph Hellwig wrote:
> On Mon, Feb 15, 2021 at 10:46:23PM +0000, David Howells wrote:
> > The in_softirq() in netfs_rreq_terminated() works fine for the cache being
> > on a normal disk, as the completion handlers may get called in softirq
> > context, but for an NVMe drive, the completion handler may get called in
> > IRQ context.
> > 
> > Fix to use in_interrupt() instead of in_softirq() throughout the read
> > helpers, particularly when deciding whether to punt code that might sleep
> > off to a worker thread.
> 
> We must not use either check, as they all are unreliable especially
> for PREEMPT-RT.

Yes, please. I try to cleanup the users one by one
    https://lore.kernel.org/r/20200914204209.256266093@linutronix.de/
    https://lore.kernel.org/amd-gfx/20210209124439.408140-1-bigeasy@linutronix.de/

Sebastian

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

