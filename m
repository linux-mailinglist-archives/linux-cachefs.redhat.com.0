Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 810A8493AFF
	for <lists+linux-cachefs@lfdr.de>; Wed, 19 Jan 2022 14:21:37 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-64-NPLegGcMPSOD7YZrB3ZNvw-1; Wed, 19 Jan 2022 08:21:25 -0500
X-MC-Unique: NPLegGcMPSOD7YZrB3ZNvw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6B68E10247A6;
	Wed, 19 Jan 2022 13:21:22 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A2BAE703A2;
	Wed, 19 Jan 2022 13:21:20 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E2F581809CB8;
	Wed, 19 Jan 2022 13:21:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20JDLErp008256 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 19 Jan 2022 08:21:15 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id B60D2112131B; Wed, 19 Jan 2022 13:21:14 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B1D951121314
	for <linux-cachefs@redhat.com>; Wed, 19 Jan 2022 13:21:11 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8F63D185A79C
	for <linux-cachefs@redhat.com>; Wed, 19 Jan 2022 13:21:11 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34]) by
	relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-170-aGB5VdUVMlSyrYIBDfkAHg-1; Wed, 19 Jan 2022 08:21:04 -0500
X-MC-Unique: aGB5VdUVMlSyrYIBDfkAHg-1
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
	Hat Linux)) id 1nAAtU-00AsCu-PA; Wed, 19 Jan 2022 13:20:56 +0000
Date: Wed, 19 Jan 2022 13:20:56 +0000
From: Matthew Wilcox <willy@infradead.org>
To: JeffleXu <jefflexu@linux.alibaba.com>
Message-ID: <YegQOHs9yjIgu1Qi@casper.infradead.org>
References: <20211227125444.21187-1-jefflexu@linux.alibaba.com>
	<20211227125444.21187-20-jefflexu@linux.alibaba.com>
	<YcndgcpQQWY8MJBD@casper.infradead.org>
	<47831875-4bdd-8398-9f2d-0466b31a4382@linux.alibaba.com>
	<99c94a78-58c4-f0af-e1d4-9aaa51bab281@linux.alibaba.com>
MIME-Version: 1.0
In-Reply-To: <99c94a78-58c4-f0af-e1d4-9aaa51bab281@linux.alibaba.com>
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
Cc: chao@kernel.org, tao.peng@linux.alibaba.com, linux-kernel@vger.kernel.org,
	joseph.qi@linux.alibaba.com, linux-cachefs@redhat.com,
	bo.liu@linux.alibaba.com, linux-fsdevel@vger.kernel.org,
	xiang@kernel.org, gerry@linux.alibaba.com,
	linux-erofs@lists.ozlabs.org, eguan@linux.alibaba.com
Subject: Re: [Linux-cachefs] [PATCH v1 19/23] cachefiles: implement
 .demand_read() for demand read
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

On Wed, Jan 12, 2022 at 05:02:13PM +0800, JeffleXu wrote:
> I'm afraid IDR can't be replaced by xarray here. Because we need an 'ID'
> for each pending read request, so that after fetching data from remote,
> user daemon could notify kernel which read request has finished by this
> 'ID'.
> 
> Currently this 'ID' is get from idr_alloc(), and actually identifies the
> position of corresponding read request inside the IDR tree. I can't find
> similar API of xarray implementing similar function, i.e., returning an
> 'ID'.

xa_alloc().

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

