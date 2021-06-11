Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 53ABA3A4A56
	for <lists+linux-cachefs@lfdr.de>; Fri, 11 Jun 2021 22:50:46 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-513-rozo4jbXOKuYcD2ofqFOuA-1; Fri, 11 Jun 2021 16:50:44 -0400
X-MC-Unique: rozo4jbXOKuYcD2ofqFOuA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 70E7E9F92B;
	Fri, 11 Jun 2021 20:50:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5A1A65D705;
	Fri, 11 Jun 2021 20:50:41 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A76331809CAD;
	Fri, 11 Jun 2021 20:50:40 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 15BKmoGD008886 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 11 Jun 2021 16:48:50 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8DF0310A1459; Fri, 11 Jun 2021 20:48:50 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8962A10A1456
	for <linux-cachefs@redhat.com>; Fri, 11 Jun 2021 20:48:46 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D7EFC857FFA
	for <linux-cachefs@redhat.com>; Fri, 11 Jun 2021 20:48:46 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-181-3KCQR4y1PXu-u5S5UZaqcA-1; Fri, 11 Jun 2021 16:48:41 -0400
X-MC-Unique: 3KCQR4y1PXu-u5S5UZaqcA-1
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
	Linux)) id 1lro4h-0037lR-Jd; Fri, 11 Jun 2021 20:48:23 +0000
Date: Fri, 11 Jun 2021 21:48:19 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Jeff Layton <jlayton@kernel.org>
Message-ID: <YMPME0Bey8Tzz37l@casper.infradead.org>
References: <20210611195904.160416-1-jlayton@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20210611195904.160416-1-jlayton@kernel.org>
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
Cc: Andrew W Elble <aweits@rit.edu>, stable@vger.kernel.org,
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Jun 11, 2021 at 03:59:04PM -0400, Jeff Layton wrote:
>  		if ((pos_in_page == 0 && len == PAGE_SIZE) ||
> -		    (pos >= i_size_read(inode)) ||
> +		    (index > (i_size_read(inode) / PAGE_SIZE)) ||

I think that wants to be ((i_size_read(inode) - 1) / PAGE_SIZE)

If your file is 4096 bytes long, that means bytes 0-4095 contain data.
Except that i_size can be 0, so ...

		if ((offset == 0 && len == PAGE_SIZE) || i_size == 0 ||
		    (index > (i_size - 1) / PAGE_SIZE) ||
		    (offset == 0 && pos + len >= i_size))
  			zero_user_segments(page, 0, pos_in_page,
  					   pos_in_page + len, PAGE_SIZE);

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

