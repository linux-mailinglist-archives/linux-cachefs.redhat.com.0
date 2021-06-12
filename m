Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 4CBBF3A4F1F
	for <lists+linux-cachefs@lfdr.de>; Sat, 12 Jun 2021 15:38:36 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-419-hZh3yXR0MU-i-BjHV66iTA-1; Sat, 12 Jun 2021 09:38:33 -0400
X-MC-Unique: hZh3yXR0MU-i-BjHV66iTA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C1C211850605;
	Sat, 12 Jun 2021 13:38:30 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 068445C232;
	Sat, 12 Jun 2021 13:38:30 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DB0581809CAD;
	Sat, 12 Jun 2021 13:38:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 15CDaXc2032106 for <linux-cachefs@listman.util.phx.redhat.com>;
	Sat, 12 Jun 2021 09:36:33 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 03564FDCC3; Sat, 12 Jun 2021 13:36:33 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F1D8DFDCDB
	for <linux-cachefs@redhat.com>; Sat, 12 Jun 2021 13:36:30 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A4B86185A7B9
	for <linux-cachefs@redhat.com>; Sat, 12 Jun 2021 13:36:30 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-460-VpISolRyM7u6S_3RjcKokw-1; Sat, 12 Jun 2021 09:36:25 -0400
X-MC-Unique: VpISolRyM7u6S_3RjcKokw-1
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
	Linux)) id 1ls3o4-003k1e-L3; Sat, 12 Jun 2021 13:36:15 +0000
Date: Sat, 12 Jun 2021 14:36:12 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Jeff Layton <jlayton@kernel.org>
Message-ID: <YMS4TOw8txQQ7VGr@casper.infradead.org>
References: <20210611195904.160416-1-jlayton@kernel.org>
	<20210612001141.167797-1-jlayton@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20210612001141.167797-1-jlayton@kernel.org>
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
Cc: Andrew W Elble <aweits@rit.edu>, stable@vger.kernel.org,
	linux-cachefs@redhat.com, pfmeec@rit.edu,
	ceph-devel@vger.kernel.org, idryomov@gmail.com
Subject: Re: [Linux-cachefs] [PATCH v2] ceph: fix write_begin optimization
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Jun 11, 2021 at 08:11:41PM -0400, Jeff Layton wrote:
>  		if ((pos_in_page == 0 && len == PAGE_SIZE) ||
> -		    (pos >= i_size_read(inode)) ||
> +		    (index > (i_size_read(inode) - 1) / PAGE_SIZE) ||
>  		    (pos_in_page == 0 && (pos + len) >= i_size_read(inode))) {

You missed the (i_size == 0) case.  And I really would factor out
reading i_size into a local variable.

>  			zero_user_segments(page, 0, pos_in_page,
>  					   pos_in_page + len, PAGE_SIZE);
> -- 
> 2.31.1
> 

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

