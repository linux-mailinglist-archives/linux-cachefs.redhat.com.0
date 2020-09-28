Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 552DC27B381
	for <lists+linux-cachefs@lfdr.de>; Mon, 28 Sep 2020 19:43:54 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-11-y86PJ2awN5GzRTMIdfbvxA-1; Mon, 28 Sep 2020 13:43:51 -0400
X-MC-Unique: y86PJ2awN5GzRTMIdfbvxA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3EA4610051AD;
	Mon, 28 Sep 2020 17:43:49 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 894D85C1BD;
	Mon, 28 Sep 2020 17:43:48 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D83E144A4D;
	Mon, 28 Sep 2020 17:43:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08SHhgBY032239 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 28 Sep 2020 13:43:42 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 915BF9459A; Mon, 28 Sep 2020 17:43:42 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8C6C29463F
	for <linux-cachefs@redhat.com>; Mon, 28 Sep 2020 17:43:35 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 649E0858287
	for <linux-cachefs@redhat.com>; Mon, 28 Sep 2020 17:43:35 +0000 (UTC)
Received: from smtp-fw-4101.amazon.com (smtp-fw-4101.amazon.com
	[72.21.198.25]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-327-PwyOi0OSPMODko9VoWHO4A-1; Mon, 28 Sep 2020 13:43:33 -0400
X-MC-Unique: PwyOi0OSPMODko9VoWHO4A-1
X-IronPort-AV: E=Sophos;i="5.77,313,1596499200"; d="scan'208";a="56772636"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
	email-inbound-relay-2b-a7fdc47a.us-west-2.amazon.com) ([10.43.8.6])
	by smtp-border-fw-out-4101.iad4.amazon.com with ESMTP;
	28 Sep 2020 17:42:29 +0000
Received: from EX13MTAUWC001.ant.amazon.com
	(pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
	by email-inbound-relay-2b-a7fdc47a.us-west-2.amazon.com (Postfix) with
	ESMTPS id CD05FC0767; Mon, 28 Sep 2020 17:42:28 +0000 (UTC)
Received: from EX13D37UWC003.ant.amazon.com (10.43.162.183) by
	EX13MTAUWC001.ant.amazon.com (10.43.162.135) with Microsoft SMTP Server
	(TLS) id 15.0.1497.2; Mon, 28 Sep 2020 17:42:28 +0000
Received: from EX13MTAUWC001.ant.amazon.com (10.43.162.135) by
	EX13D37UWC003.ant.amazon.com (10.43.162.183) with Microsoft SMTP Server
	(TLS) id 15.0.1497.2; Mon, 28 Sep 2020 17:42:28 +0000
Received: from dev-dsk-fllinden-2c-c1893d73.us-west-2.amazon.com
	(172.23.141.97) by mail-relay.amazon.com (10.43.162.232) with Microsoft
	SMTP Server id 15.0.1497.2 via Frontend Transport;
	Mon, 28 Sep 2020 17:42:27 +0000
Received: by dev-dsk-fllinden-2c-c1893d73.us-west-2.amazon.com (Postfix,
	from userid 6262777)
	id 2754DC138B; Mon, 28 Sep 2020 17:42:28 +0000 (UTC)
Date: Mon, 28 Sep 2020 17:42:28 +0000
From: Frank van der Linden <fllinden@amazon.com>
To: Chuck Lever <chuck.lever@oracle.com>
Message-ID: <20200928174228.GA31536@dev-dsk-fllinden-2c-c1893d73.us-west-2.amazon.com>
References: <20200915172140.GA32632@fieldses.org>
	<2001715792.39705019.1600358470997.JavaMail.zimbra@dneg.com>
	<20200917190931.GA6858@fieldses.org>
	<20200917202303.GA29892@dev-dsk-fllinden-2c-c1893d73.us-west-2.amazon.com>
	<76A4DC7D-D4F7-4A17-A67D-282E8522132A@oracle.com>
	<1790619463.44171163.1600892707423.JavaMail.zimbra@dneg.com>
	<20200923210157.GA1650@dev-dsk-fllinden-2c-c1893d73.us-west-2.amazon.com>
	<108670779.52656705.1601110822013.JavaMail.zimbra@dneg.com>
	<20200928154949.GA14702@dev-dsk-fllinden-2c-c1893d73.us-west-2.amazon.com>
	<B38FC84D-2658-47A6-9531-EFB6D0A64D4A@oracle.com>
MIME-Version: 1.0
In-Reply-To: <B38FC84D-2658-47A6-9531-EFB6D0A64D4A@oracle.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
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
Cc: Bruce Fields <bfields@fieldses.org>, Daire Byrne <daire@dneg.com>,
	linux-cachefs <linux-cachefs@redhat.com>, Linux
	NFS Mailing List <linux-nfs@vger.kernel.org>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Sep 28, 2020 at 12:08:09PM -0400, Chuck Lever wrote:
> 
> 
> > On Sep 28, 2020, at 11:49 AM, Frank van der Linden <fllinden@amazon.com> wrote:
> >
> > Bruce - if you want me to 'formally' submit a version of the patch, let me
> > know. Just disabling the cache for v4, which comes down to reverting a few
> > commits, is probably simpler - I'd be able to test that too.
> 
> I'd be interested in seeing that. From what I saw, the mechanics of
> unhooking the cache from NFSv4 simply involve reverting patches, but
> there appear to be some recent changes that depend on the open
> filecache that might be difficult to deal with, like
> 
> b66ae6dd0c30 ("nfsd: Pass the nfsd_file as arguments to nfsd4_clone_file_range()")

Hm, yes, I missed nf_rwsem being added to the struct.

Probably easier to keep nfsd_file, and have v4 use just straight alloc/free
functions for it that don't touch the cache at all.

- Frank

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

