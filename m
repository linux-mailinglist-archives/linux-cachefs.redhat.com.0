Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id E2D5F3A5962
	for <lists+linux-cachefs@lfdr.de>; Sun, 13 Jun 2021 17:26:07 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-569-BnNMYBgfNoemNjWjlGQuRQ-1; Sun, 13 Jun 2021 11:26:05 -0400
X-MC-Unique: BnNMYBgfNoemNjWjlGQuRQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 154168015A4;
	Sun, 13 Jun 2021 15:26:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 001C610013C1;
	Sun, 13 Jun 2021 15:26:02 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5FCCE1809CAD;
	Sun, 13 Jun 2021 15:26:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 15DFPwBa007111 for <linux-cachefs@listman.util.phx.redhat.com>;
	Sun, 13 Jun 2021 11:25:58 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 733502028132; Sun, 13 Jun 2021 15:25:58 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6F09820239F9
	for <linux-cachefs@redhat.com>; Sun, 13 Jun 2021 15:25:56 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2FFAF80015A
	for <linux-cachefs@redhat.com>; Sun, 13 Jun 2021 15:25:56 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-279-k5YacbUKPNOPg5mPkWKwLA-1;
	Sun, 13 Jun 2021 11:25:52 -0400
X-MC-Unique: k5YacbUKPNOPg5mPkWKwLA-1
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0162F61040;
	Sun, 13 Jun 2021 15:25:49 +0000 (UTC)
Message-ID: <04174e6beaff47fb4dc32ff6cc32ae8667008edd.camel@kernel.org>
From: Jeff Layton <jlayton@kernel.org>
To: Matthew Wilcox <willy@infradead.org>
Date: Sun, 13 Jun 2021 11:25:48 -0400
In-Reply-To: <YMYg+dYOhSVGg58R@casper.infradead.org>
References: <YMXmRo17oy8fDn2b@casper.infradead.org>
	<20210613113650.8672-1-jlayton@kernel.org>
	<a58a297994700b95c85c15bc13e830ecb7ac61e7.camel@kernel.org>
	<YMYg+dYOhSVGg58R@casper.infradead.org>
User-Agent: Evolution 3.40.1 (3.40.1-1.fc34)
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: linux-cachefs@redhat.com
Cc: Elble <aweits@rit.edu>, Andrew, stable@vger.kernel.org,
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, 2021-06-13 at 16:15 +0100, Matthew Wilcox wrote:
> On Sun, Jun 13, 2021 at 08:02:12AM -0400, Jeff Layton wrote:
> > > +	/* clamp length to end of the current page */
> > > +	if (len > PAGE_SIZE)
> > > +		len = PAGE_SIZE - offset;
> > 
> > Actually, I think this should be:
> > 
> > 	len = min(len, PAGE_SIZE - offset);
> > 
> > Otherwise, len could still go beyond the end of the page.
> 
> I don't understand why you want to clamp length instead of just coping
> with len being > PAGE_SIZE.
> 
> > > +
> > > +	/* full page write */
> > > +	if (offset == 0 && len == PAGE_SIZE)
> > > +		goto zero_out;
> 
> That becomes >=.
> 
> > > +	/* zero-length file */
> > > +	if (i_size == 0)
> > > +		goto zero_out;
> > > +
> > > +	/* position beyond last page in the file */
> > > +	if (index > ((i_size - 1) / PAGE_SIZE))
> > > +		goto zero_out;
> > > +
> > > +	/* write that covers the the page from start to EOF or beyond it */
> > > +	if (offset == 0 && (pos + len) >= i_size)
> > > +		goto zero_out;
> 
> That doesn't need any change.
> 
> > > +	return false;
> > > +zero_out:
> > > +	zero_user_segments(page, 0, offset, offset + len, PAGE_SIZE);
> 
> That also doesn't need any change.
> 

Won't it though? offset+len will could be beyond the end of the page at
that point. Hmm I guess zero_user_segments does this:

        if (start2 >= end2)
                start2 = end2 = 0;

...so that makes the second segment copy a no-op.

Ok, fair enough -- I'll get rid of the clamping and just allow len to be
longer than PAGE_SIZE in the checks.

Thanks,
-- 
Jeff Layton <jlayton@kernel.org>

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

