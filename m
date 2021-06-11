Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 9D9763A4AF2
	for <lists+linux-cachefs@lfdr.de>; Sat, 12 Jun 2021 00:21:15 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-105-PSkyCx6MMtqGxzClP6vxXQ-1; Fri, 11 Jun 2021 18:21:13 -0400
X-MC-Unique: PSkyCx6MMtqGxzClP6vxXQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6ABBA801106;
	Fri, 11 Jun 2021 22:21:10 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5E159136F5;
	Fri, 11 Jun 2021 22:21:10 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AE44246F82;
	Fri, 11 Jun 2021 22:21:09 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 15BML6qb018023 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 11 Jun 2021 18:21:06 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7C9EA2039DA9; Fri, 11 Jun 2021 22:21:06 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7871F2039D9D
	for <linux-cachefs@redhat.com>; Fri, 11 Jun 2021 22:21:03 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3AA1B800B28
	for <linux-cachefs@redhat.com>; Fri, 11 Jun 2021 22:21:03 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-438-f_n7e4CzN2y7OZDN8LDH3A-1;
	Fri, 11 Jun 2021 18:21:00 -0400
X-MC-Unique: f_n7e4CzN2y7OZDN8LDH3A-1
Received: by mail.kernel.org (Postfix) with ESMTPSA id D94E5613CF;
	Fri, 11 Jun 2021 22:20:58 +0000 (UTC)
Message-ID: <74f391de84d957a3d726b0bbb00ab81d0d90d521.camel@kernel.org>
From: Jeff Layton <jlayton@kernel.org>
To: Matthew Wilcox <willy@infradead.org>
Date: Fri, 11 Jun 2021 18:20:57 -0400
In-Reply-To: <YMPME0Bey8Tzz37l@casper.infradead.org>
References: <20210611195904.160416-1-jlayton@kernel.org>
	<YMPME0Bey8Tzz37l@casper.infradead.org>
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
Subject: Re: [Linux-cachefs] [PATCH] ceph: fix write_begin optimization when
 write is beyond EOF
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, 2021-06-11 at 21:48 +0100, Matthew Wilcox wrote:
> On Fri, Jun 11, 2021 at 03:59:04PM -0400, Jeff Layton wrote:
> >  		if ((pos_in_page == 0 && len == PAGE_SIZE) ||
> > -		    (pos >= i_size_read(inode)) ||
> > +		    (index > (i_size_read(inode) / PAGE_SIZE)) ||
> 
> I think that wants to be ((i_size_read(inode) - 1) / PAGE_SIZE)
> 
> If your file is 4096 bytes long, that means bytes 0-4095 contain data.
> Except that i_size can be 0, so ...
> 
> 		if ((offset == 0 && len == PAGE_SIZE) || i_size == 0 ||
> 		    (index > (i_size - 1) / PAGE_SIZE) ||
> 		    (offset == 0 && pos + len >= i_size))
>   			zero_user_segments(page, 0, pos_in_page,
>   					   pos_in_page + len, PAGE_SIZE);
> 

Oh, right -- I'll fix that and send a v2. Sorry for the noise!

-- 
Jeff Layton <jlayton@kernel.org>

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

