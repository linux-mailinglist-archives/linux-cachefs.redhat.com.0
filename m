Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 2E8DA3A4465
	for <lists+linux-cachefs@lfdr.de>; Fri, 11 Jun 2021 16:53:14 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-162-BUXwVPh0NC-cAnjDCojfUA-1; Fri, 11 Jun 2021 10:53:11 -0400
X-MC-Unique: BUXwVPh0NC-cAnjDCojfUA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CE61C8189C6;
	Fri, 11 Jun 2021 14:53:08 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 68EB21001B2C;
	Fri, 11 Jun 2021 14:53:08 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E6E6146F58;
	Fri, 11 Jun 2021 14:53:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 15BEr2dL008951 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 11 Jun 2021 10:53:02 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6E30521686BD; Fri, 11 Jun 2021 14:53:02 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 69CEB216028B
	for <linux-cachefs@redhat.com>; Fri, 11 Jun 2021 14:53:00 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 03DE01825065
	for <linux-cachefs@redhat.com>; Fri, 11 Jun 2021 14:53:00 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-30-ESD8RNILOh-ew5ifloSi_Q-1; 
	Fri, 11 Jun 2021 10:52:57 -0400
X-MC-Unique: ESD8RNILOh-ew5ifloSi_Q-1
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2C607611CD;
	Fri, 11 Jun 2021 14:52:56 +0000 (UTC)
Message-ID: <a24c3c070c9fc3529a51f00f9ccc3d0abdd0b821.camel@kernel.org>
From: Jeff Layton <jlayton@kernel.org>
To: Andrew W Elble <aweits@rit.edu>
Date: Fri, 11 Jun 2021 10:52:55 -0400
In-Reply-To: <m2h7i45vzl.fsf@discipline.rit.edu>
References: <20200916173854.330265-1-jlayton@kernel.org>
	<20200916173854.330265-6-jlayton@kernel.org>
	<7817f98d3b2daafe113bf8290cc8c7adbb86fe99.camel@kernel.org>
	<m2h7i45vzl.fsf@discipline.rit.edu>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: linux-cachefs@redhat.com
Cc: pfmeec@rit.edu, ceph-devel@vger.kernel.org, linux-cachefs@redhat.com
Subject: Re: [Linux-cachefs] [PATCH 5/5] ceph: fold
 ceph_update_writeable_page into ceph_write_begin
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

On Fri, 2021-06-11 at 10:14 -0400, Andrew W Elble wrote:
> We're seeing file corruption while running 5.10, bisected to 1cc1699070bd:
> 
> > > +static int ceph_write_begin(struct file *file, struct address_space *mapping,
> > > +			    loff_t pos, unsigned len, unsigned flags,
> > > +			    struct page **pagep, void **fsdata)
> 
> <snip>
> 
> > > +		/*
> > > +		 * In some cases we don't need to read at all:
> > > +		 * - full page write
> > > +		 * - write that lies completely beyond EOF
> > > +		 * - write that covers the the page from start to EOF or beyond it
> > > +		 */
> > > +		if ((pos_in_page == 0 && len == PAGE_SIZE) ||
> > > +		    (pos >= i_size_read(inode)) ||
> 
> Shouldn't this be '((pos & PAGE_MASK) >= i_size_read(inode)) ||' ?
> 
> Seems like fs/netfs/read_helper.c currently has the same issue?
> 

Yeah...I think you may be right. Have you tried a patch that does that
and does it fix the issue?

Also, do you happen to have a testcase that we could stick in xfstests
for this? If not, we can probably write one, but if you already have one
that'd be great.



> > > +		    (pos_in_page == 0 && (pos + len) >= i_size_read(inode))) {
> > > +			zero_user_segments(page, 0, pos_in_page,
> > > +					   pos_in_page + len, PAGE_SIZE);
> > > +			break;
> > > +		}
> 

-- 
Jeff Layton <jlayton@kernel.org>

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

