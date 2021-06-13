Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id C4B753A594A
	for <lists+linux-cachefs@lfdr.de>; Sun, 13 Jun 2021 17:15:53 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-143-nTPdppC8MvKznlm5RardNQ-1; Sun, 13 Jun 2021 11:15:51 -0400
X-MC-Unique: nTPdppC8MvKznlm5RardNQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3A1B58015D0;
	Sun, 13 Jun 2021 15:15:49 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0C2D819C44;
	Sun, 13 Jun 2021 15:15:48 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 483C01809CAC;
	Sun, 13 Jun 2021 15:15:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 15DFFh7D005362 for <linux-cachefs@listman.util.phx.redhat.com>;
	Sun, 13 Jun 2021 11:15:43 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 47BCC2162386; Sun, 13 Jun 2021 15:15:43 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 43A1B2162382
	for <linux-cachefs@redhat.com>; Sun, 13 Jun 2021 15:15:40 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 09801811E9C
	for <linux-cachefs@redhat.com>; Sun, 13 Jun 2021 15:15:40 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-163-SGfcdbOfOKihNYLwQ96BHw-1; Sun, 13 Jun 2021 11:15:37 -0400
X-MC-Unique: SGfcdbOfOKihNYLwQ96BHw-1
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
	Linux)) id 1lsRpJ-004bY9-Px; Sun, 13 Jun 2021 15:15:10 +0000
Date: Sun, 13 Jun 2021 16:15:05 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Jeff Layton <jlayton@kernel.org>
Message-ID: <YMYg+dYOhSVGg58R@casper.infradead.org>
References: <YMXmRo17oy8fDn2b@casper.infradead.org>
	<20210613113650.8672-1-jlayton@kernel.org>
	<a58a297994700b95c85c15bc13e830ecb7ac61e7.camel@kernel.org>
MIME-Version: 1.0
In-Reply-To: <a58a297994700b95c85c15bc13e830ecb7ac61e7.camel@kernel.org>
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
Cc: Andrew W Elble <aweits@rit.edu>, stable@vger.kernel.org,
	linux-cachefs@redhat.com, pfmeec@rit.edu,
	ceph-devel@vger.kernel.org, idryomov@gmail.com
Subject: Re: [Linux-cachefs] [PATCH v4] ceph: fix write_begin optimization
 when write is beyond EOF
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

On Sun, Jun 13, 2021 at 08:02:12AM -0400, Jeff Layton wrote:
> > +	/* clamp length to end of the current page */
> > +	if (len > PAGE_SIZE)
> > +		len = PAGE_SIZE - offset;
> 
> Actually, I think this should be:
> 
> 	len = min(len, PAGE_SIZE - offset);
> 
> Otherwise, len could still go beyond the end of the page.

I don't understand why you want to clamp length instead of just coping
with len being > PAGE_SIZE.

> > +
> > +	/* full page write */
> > +	if (offset == 0 && len == PAGE_SIZE)
> > +		goto zero_out;

That becomes >=.

> > +	/* zero-length file */
> > +	if (i_size == 0)
> > +		goto zero_out;
> > +
> > +	/* position beyond last page in the file */
> > +	if (index > ((i_size - 1) / PAGE_SIZE))
> > +		goto zero_out;
> > +
> > +	/* write that covers the the page from start to EOF or beyond it */
> > +	if (offset == 0 && (pos + len) >= i_size)
> > +		goto zero_out;

That doesn't need any change.

> > +	return false;
> > +zero_out:
> > +	zero_user_segments(page, 0, offset, offset + len, PAGE_SIZE);

That also doesn't need any change.

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

