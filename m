Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4925F5A1828
	for <lists+linux-cachefs@lfdr.de>; Thu, 25 Aug 2022 19:53:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1661450006;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=gL8Az/RfhTmCeYl6pIN02v3rQHSZmJUhrcnyLZZyT/I=;
	b=IyvEBARALHlI99Qb0ATUQXGkGlOnP7409i+WjxCAdr7oUOOwRaBPwzmeP2nnxR+JTqmGvC
	/XMCgwFNOMJpODW7WpuN7ejVVqRNB0JGwZ/4MHZ3Ti6Zei5ttZz1WW+Yi7DxfSGyoCbH5S
	hbqe747kKJWmEGL/qoF6f7GWe2ms0+Y=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-637-VEsaYIvnPr6008f5qBMBUA-1; Thu, 25 Aug 2022 13:53:25 -0400
X-MC-Unique: VEsaYIvnPr6008f5qBMBUA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5D4FD29AB405;
	Thu, 25 Aug 2022 17:53:24 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A93CF1121315;
	Thu, 25 Aug 2022 17:53:23 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 7989B1946A5E;
	Thu, 25 Aug 2022 17:53:23 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 103021946A43 for <linux-cachefs@listman.corp.redhat.com>;
 Thu, 25 Aug 2022 17:53:22 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id D45329458A; Thu, 25 Aug 2022 17:53:21 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D0A9F4C819
 for <linux-cachefs@redhat.com>; Thu, 25 Aug 2022 17:53:21 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B5D7F381079E
 for <linux-cachefs@redhat.com>; Thu, 25 Aug 2022 17:53:21 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_128_GCM_SHA256) id us-mta-489-Za20tR_FMsOBq02Dk8-jvg-1; Thu,
 25 Aug 2022 13:53:18 -0400
X-MC-Unique: Za20tR_FMsOBq02Dk8-jvg-1
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1oRH2Z-00HROI-5G; Thu, 25 Aug 2022 17:53:15 +0000
Date: Thu, 25 Aug 2022 18:53:15 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Trond Myklebust <trondmy@hammerspace.com>
Message-ID: <Ywe3C/EvKFYEwKPy@casper.infradead.org>
References: <20220824093501.384755-1-dwysocha@redhat.com>
 <20220824093501.384755-3-dwysocha@redhat.com>
 <429ecc819fcffe63d60dbb2b72f9022d2a21ddd8.camel@hammerspace.com>
 <CALF+zOknvMZyufSUD-g9Z9Y5RfwE-vUFT+CF0kxqbcpR=yJPJw@mail.gmail.com>
 <216681.1661350326@warthog.procyon.org.uk>
 <5ab3188affa7e56e68a4f66a42f45d7086c1da23.camel@hammerspace.com>
 <YwZXfSXMzZgaSPAg@casper.infradead.org>
 <5dfadceb26da1b4d8d499221a5ff1d3c80ad59c0.camel@hammerspace.com>
 <YweOySTkKQ3PDLCv@casper.infradead.org>
 <b4cbbdef254e9e0e6feb41455d809aaf0c5abfdb.camel@hammerspace.com>
MIME-Version: 1.0
In-Reply-To: <b4cbbdef254e9e0e6feb41455d809aaf0c5abfdb.camel@hammerspace.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Subject: Re: [Linux-cachefs] [RFC PATCH 2/3] NFS: Add support for netfs in
 struct nfs_inode and Kconfig
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-cachefs>, 
 <mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/linux-cachefs/>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-cachefs>,
 <mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Cc: "linux-nfs@vger.kernel.org" <linux-nfs@vger.kernel.org>,
 "linux-cachefs@redhat.com" <linux-cachefs@redhat.com>,
 "benmaynard@google.com" <benmaynard@google.com>,
 "anna.schumaker@netapp.com" <anna.schumaker@netapp.com>
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Aug 25, 2022 at 03:32:25PM +0000, Trond Myklebust wrote:
> I'm not talking about the transition of dirty->clean. We already deal
> with that. I'm talking about supporting large folios on read-mainly
> workloads.
> 
> NFS can happily support 1MB sized folios, or even larger than that if
> there is a compelling reason to do so.
> 
> However, having to read in the entire folio contents if the user is
> just asking for a few bytes on a database-style random read workload
> can quickly get onerous.

Ah, we don't do that.  If the user is only asking for a few bytes and
there's no indication that it's part of a streaming read, we allocate &
fill a single page, just as before.  We adapt to the user's workload
and only allocate multi-page folios when there's evidence that it'll
be useful to do so.

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

