Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 640BA3AECF5
	for <lists+linux-cachefs@lfdr.de>; Mon, 21 Jun 2021 18:01:40 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-594-Yk6ZdWLIOMe6Bv-khXPdlw-1; Mon, 21 Jun 2021 12:01:37 -0400
X-MC-Unique: Yk6ZdWLIOMe6Bv-khXPdlw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EC2241922965;
	Mon, 21 Jun 2021 16:01:35 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DCD6E620DE;
	Mon, 21 Jun 2021 16:01:35 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 93E6F1809C99;
	Mon, 21 Jun 2021 16:01:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 15LG1XLv032681 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 21 Jun 2021 12:01:33 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1406050169; Mon, 21 Jun 2021 16:01:33 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0F4BA50166
	for <linux-cachefs@redhat.com>; Mon, 21 Jun 2021 16:01:29 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9578480D08E
	for <linux-cachefs@redhat.com>; Mon, 21 Jun 2021 16:01:29 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-122-q-P6dpqIMB-r8aQCx54G5Q-1; Mon, 21 Jun 2021 12:01:25 -0400
X-MC-Unique: q-P6dpqIMB-r8aQCx54G5Q-1
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
	Hat Linux)) id 1lvMM8-00DGcM-F8; Mon, 21 Jun 2021 16:01:04 +0000
Date: Mon, 21 Jun 2021 17:01:00 +0100
From: Matthew Wilcox <willy@infradead.org>
To: David Howells <dhowells@redhat.com>
Message-ID: <YNC3vP4BKi5l6SfW@casper.infradead.org>
References: <162429000639.2770648.6368710175435880749.stgit@warthog.procyon.org.uk>
	<162429001766.2770648.1072619730387446884.stgit@warthog.procyon.org.uk>
MIME-Version: 1.0
In-Reply-To: <162429001766.2770648.1072619730387446884.stgit@warthog.procyon.org.uk>
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
Cc: Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
	linux-cachefs@redhat.com, Al Viro <viro@zeniv.linux.org.uk>,
	linux-fsdevel@vger.kernel.org, linux-afs@lists.infradead.org
Subject: Re: [Linux-cachefs] [PATCH v3 1/2] afs: Fix afs_write_end() to
	handle short writes
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

On Mon, Jun 21, 2021 at 04:40:17PM +0100, David Howells wrote:
> Fix afs_write_end() to correctly handle a short copy into the intended
> write region of the page.  Two things are necessary:
> 
>  (1) If the page is not up to date, then we should just return 0
>      (ie. indicating a zero-length copy).  The loop in
>      generic_perform_write() will go around again, possibly breaking up the
>      iterator into discrete chunks[1].
> 
>      This is analogous to commit b9de313cf05fe08fa59efaf19756ec5283af672a
>      for ceph.
> 
>  (2) The page should not have been set uptodate if it wasn't completely set
>      up by netfs_write_begin() (this will be fixed in the next patch), so
>      we need to set uptodate here in such a case.
> 
> Also remove the assertion that was checking that the page was set uptodate
> since it's now set uptodate if it wasn't already a few lines above.  The
> assertion was from when uptodate was set elsewhere.
> 
> Changes:
> v3: Remove the handling of len exceeding the end of the page.
> 
> Fixes: 3003bbd0697b ("afs: Use the netfs_write_begin() helper")
> Reported-by: Jeff Layton <jlayton@kernel.org>
> Signed-off-by: David Howells <dhowells@redhat.com>
> Acked-by: Jeff Layton <jlayton@kernel.org>
> cc: Al Viro <viro@zeniv.linux.org.uk>
> cc: Matthew Wilcox <willy@infradead.org>
> cc: linux-afs@lists.infradead.org
> Link: https://lore.kernel.org/r/YMwVp268KTzTf8cN@zeniv-ca.linux.org.uk/ [1]
> Link: https://lore.kernel.org/r/162367682522.460125.5652091227576721609.stgit@warthog.procyon.org.uk/ # v1
> Link: https://lore.kernel.org/r/162391825688.1173366.3437507255136307904.stgit@warthog.procyon.org.uk/ # v2

Reviewed-by: Matthew Wilcox (Oracle) <willy@infradead.org>

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

