Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id E800F2B57B6
	for <lists+linux-cachefs@lfdr.de>; Tue, 17 Nov 2020 04:16:22 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-131-tkykke9TNSuJMH3LGGPGaw-1; Mon, 16 Nov 2020 22:16:20 -0500
X-MC-Unique: tkykke9TNSuJMH3LGGPGaw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 880E187950E;
	Tue, 17 Nov 2020 03:16:15 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A8E9E6EF44;
	Tue, 17 Nov 2020 03:16:14 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 76A05183D021;
	Tue, 17 Nov 2020 03:16:11 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AH3G89N001884 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 16 Nov 2020 22:16:08 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 015A78A4CF; Tue, 17 Nov 2020 03:16:08 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F043B8A4C9
	for <linux-cachefs@redhat.com>; Tue, 17 Nov 2020 03:16:05 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ACEF78007D9
	for <linux-cachefs@redhat.com>; Tue, 17 Nov 2020 03:16:05 +0000 (UTC)
Received: from fieldses.org (fieldses.org [173.255.197.46]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-503-qPOEV_Q5NDqPNMMd-af6BQ-1;
	Mon, 16 Nov 2020 22:16:02 -0500
X-MC-Unique: qPOEV_Q5NDqPNMMd-af6BQ-1
Received: by fieldses.org (Postfix, from userid 2815)
	id 77B151C29; Mon, 16 Nov 2020 22:16:01 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.11.0 fieldses.org 77B151C29
Date: Mon, 16 Nov 2020 22:16:01 -0500
From: bfields <bfields@fieldses.org>
To: Jeff Layton <jlayton@kernel.org>
Message-ID: <20201117031601.GB10526@fieldses.org>
References: <883314904.86570901.1605222357023.JavaMail.zimbra@dneg.com>
	<20201113145050.GB1299@fieldses.org>
	<20201113222600.GC1299@fieldses.org>
	<b0d61b4053442ba46fd2c707ee7e0608704c2598.camel@kernel.org>
	<20201116155619.GF898@fieldses.org>
	<83ebb6dc68216ce3f3dfd2a2736b7a301550efc5.camel@kernel.org>
	<20201116161407.GG898@fieldses.org>
	<db55bab87b6fc9dd1594f8c2e853f07b1165ff5d.camel@kernel.org>
	<20201116190336.GH898@fieldses.org>
	<0047077b3bd79a96589626ba154e6d9e95a35478.camel@kernel.org>
MIME-Version: 1.0
In-Reply-To: <0047077b3bd79a96589626ba154e6d9e95a35478.camel@kernel.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Mimecast-Spam-Signature: yes
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: linux-cachefs@redhat.com
Cc: Daire Byrne <daire@dneg.com>, linux-cachefs <linux-cachefs@redhat.com>,
	linux-nfs <linux-nfs@vger.kernel.org>,
	Trond Myklebust <trondmy@hammerspace.com>
Subject: Re: [Linux-cachefs] Adventures in NFS re-exporting
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-cachefs>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Sender: linux-cachefs-bounces@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Nov 16, 2020 at 03:03:15PM -0500, Jeff Layton wrote:
> Another idea might be to add a new fetch_iversion export operation that
> returns a u64. Roll two generic functions -- one to handle the
> xfs/ext4/btrfs case and another for the NFS/AFS/Ceph case (where we just
> fetch it raw). When the op is a NULL pointer, treat it like the
> !IS_I_VERSION case today.

OK, a rough attempt follows, mostly untested.--b.

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

