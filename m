Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 7661F31DB8F
	for <lists+linux-cachefs@lfdr.de>; Wed, 17 Feb 2021 15:41:21 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-248-Cwz3J0pyNi-vI1h2j9Tsiw-1; Wed, 17 Feb 2021 09:41:17 -0500
X-MC-Unique: Cwz3J0pyNi-vI1h2j9Tsiw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AB0AE19611A4;
	Wed, 17 Feb 2021 14:41:14 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 904F010016FF;
	Wed, 17 Feb 2021 14:41:13 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 20E8F18095CB;
	Wed, 17 Feb 2021 14:41:12 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 11HEf78C006104 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 17 Feb 2021 09:41:10 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id DA12E2062919; Wed, 17 Feb 2021 14:41:07 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D4CAE2062917
	for <linux-cachefs@redhat.com>; Wed, 17 Feb 2021 14:41:05 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 89940858F15
	for <linux-cachefs@redhat.com>; Wed, 17 Feb 2021 14:41:05 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-567-ecZDeXlWOBKzgGLp-B7RkQ-1; Wed, 17 Feb 2021 09:41:03 -0500
X-MC-Unique: ecZDeXlWOBKzgGLp-B7RkQ-1
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
	Linux)) id 1lCNyj-000ZXQ-Pp; Wed, 17 Feb 2021 14:39:54 +0000
Date: Wed, 17 Feb 2021 14:38:57 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Jeff Layton <jlayton@kernel.org>
Message-ID: <20210217143857.GK2858050@casper.infradead.org>
References: <20210217125845.10319-1-jlayton@kernel.org>
	<20210217125845.10319-3-jlayton@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20210217125845.10319-3-jlayton@kernel.org>
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
Cc: linux-cachefs@redhat.com, linux-fsdevel@vger.kernel.org, idryomov@gmail.com,
	ceph-devel@vger.kernel.org
Subject: Re: [Linux-cachefs] [PATCH v2 2/6] ceph: rework PageFsCache handling
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
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Feb 17, 2021 at 07:58:41AM -0500, Jeff Layton wrote:
> -static int ceph_releasepage(struct page *page, gfp_t g)
> +static int ceph_releasepage(struct page *page, gfp_t gfp_flags)
>  {
>  	dout("%p releasepage %p idx %lu (%sdirty)\n", page->mapping->host,
>  	     page, page->index, PageDirty(page) ? "" : "not ");
>  
> +	if (PageFsCache(page)) {
> +		if (!(gfp_flags & __GFP_DIRECT_RECLAIM) || !(gfp_flags & __GFP_FS))

If you called it 'gfp' instead of 'gfp_flags', you wouldn't go over 80
columns ;-)

		if (!(gfp & __GFP_DIRECT_RECLAIM) || !(gfp & __GFP_FS))

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

