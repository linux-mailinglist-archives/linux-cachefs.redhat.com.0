Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id F2B2A322853
	for <lists+linux-cachefs@lfdr.de>; Tue, 23 Feb 2021 10:59:51 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-467-CV1nVLOEPimiHJbzKVLYwA-1; Tue, 23 Feb 2021 04:59:47 -0500
X-MC-Unique: CV1nVLOEPimiHJbzKVLYwA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E3A41835E2D;
	Tue, 23 Feb 2021 09:59:40 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C8F3719C45;
	Tue, 23 Feb 2021 09:59:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B2B2758073;
	Tue, 23 Feb 2021 09:59:40 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 11G8piCa010709 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 16 Feb 2021 03:51:44 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 20EC5F00FB; Tue, 16 Feb 2021 08:51:44 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1B4C38578C
	for <linux-cachefs@redhat.com>; Tue, 16 Feb 2021 08:51:41 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 29F8B185A7BC
	for <linux-cachefs@redhat.com>; Tue, 16 Feb 2021 08:51:41 +0000 (UTC)
Received: from verein.lst.de (verein.lst.de [213.95.11.211]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-402-NUIhMAxjPA-bQzVhVSU-Rw-1;
	Tue, 16 Feb 2021 03:51:39 -0500
X-MC-Unique: NUIhMAxjPA-bQzVhVSU-Rw-1
Received: by verein.lst.de (Postfix, from userid 2407)
	id C34B368B05; Tue, 16 Feb 2021 09:42:30 +0100 (CET)
Date: Tue, 16 Feb 2021 09:42:30 +0100
From: Christoph Hellwig <hch@lst.de>
To: David Howells <dhowells@redhat.com>
Message-ID: <20210216084230.GA23669@lst.de>
References: <161340385320.1303470.2392622971006879777.stgit@warthog.procyon.org.uk>
	<1376938.1613429183@warthog.procyon.org.uk>
MIME-Version: 1.0
In-Reply-To: <1376938.1613429183@warthog.procyon.org.uk>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: linux-cachefs@redhat.com
X-Mailman-Approved-At: Tue, 23 Feb 2021 04:59:26 -0500
Cc: linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, Dominique Martinet <asmadeus@codewreck.org>,
	Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
	Matthew Wilcox <willy@infradead.org>,
	linux-afs@lists.infradead.org, Steve French <sfrench@samba.org>,
	linux-mm@kvack.org, linux-cachefs@redhat.com,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Trond Myklebust <trondmy@hammerspace.com>,
	Marc Dionne <marc.dionne@auristor.com>,
	v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
	Christoph Hellwig <hch@lst.de>, Anna Schumaker <anna.schumaker@netapp.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Feb 15, 2021 at 10:46:23PM +0000, David Howells wrote:
> The in_softirq() in netfs_rreq_terminated() works fine for the cache being
> on a normal disk, as the completion handlers may get called in softirq
> context, but for an NVMe drive, the completion handler may get called in
> IRQ context.
> 
> Fix to use in_interrupt() instead of in_softirq() throughout the read
> helpers, particularly when deciding whether to punt code that might sleep
> off to a worker thread.

We must not use either check, as they all are unreliable especially
for PREEMPT-RT.

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

