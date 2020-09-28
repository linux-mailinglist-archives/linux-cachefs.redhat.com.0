Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 0CDAC27B12F
	for <lists+linux-cachefs@lfdr.de>; Mon, 28 Sep 2020 17:51:09 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-21-X60CsibNOvKcuq6UTejLzw-1; Mon, 28 Sep 2020 11:51:07 -0400
X-MC-Unique: X60CsibNOvKcuq6UTejLzw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C87121084C90;
	Mon, 28 Sep 2020 15:51:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ED1D878814;
	Mon, 28 Sep 2020 15:51:01 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A97C944A4E;
	Mon, 28 Sep 2020 15:50:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08SFos0T016989 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 28 Sep 2020 11:50:54 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E87022EFB8; Mon, 28 Sep 2020 15:50:53 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E377B2EFB3
	for <linux-cachefs@redhat.com>; Mon, 28 Sep 2020 15:50:51 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 83300800260
	for <linux-cachefs@redhat.com>; Mon, 28 Sep 2020 15:50:51 +0000 (UTC)
Received: from smtp-fw-2101.amazon.com (smtp-fw-2101.amazon.com
	[72.21.196.25]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-65-SUyezAH7Nuarp7lK9SXf0g-1; Mon, 28 Sep 2020 11:50:48 -0400
X-MC-Unique: SUyezAH7Nuarp7lK9SXf0g-1
X-IronPort-AV: E=Sophos;i="5.77,313,1596499200"; d="scan'208";a="56504845"
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO
	email-inbound-relay-1d-74cf8b49.us-east-1.amazon.com) ([10.43.8.2])
	by smtp-border-fw-out-2101.iad2.amazon.com with ESMTP;
	28 Sep 2020 15:49:55 +0000
Received: from EX13MTAUEA001.ant.amazon.com
	(iad12-ws-svc-p26-lb9-vlan3.iad.amazon.com [10.40.163.38])
	by email-inbound-relay-1d-74cf8b49.us-east-1.amazon.com (Postfix) with
	ESMTPS id 6391AC05DE; Mon, 28 Sep 2020 15:49:52 +0000 (UTC)
Received: from EX13D21UEA002.ant.amazon.com (10.43.61.179) by
	EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server
	(TLS) id 15.0.1497.2; Mon, 28 Sep 2020 15:49:50 +0000
Received: from EX13MTAUEA002.ant.amazon.com (10.43.61.77) by
	EX13D21UEA002.ant.amazon.com (10.43.61.179) with Microsoft SMTP Server
	(TLS) id 15.0.1497.2; Mon, 28 Sep 2020 15:49:50 +0000
Received: from dev-dsk-fllinden-2c-c1893d73.us-west-2.amazon.com
	(172.23.141.97) by mail-relay.amazon.com (10.43.61.169) with Microsoft
	SMTP Server id 15.0.1497.2 via Frontend Transport;
	Mon, 28 Sep 2020 15:49:49 +0000
Received: by dev-dsk-fllinden-2c-c1893d73.us-west-2.amazon.com (Postfix,
	from userid 6262777)
	id 9F9F4C13F0; Mon, 28 Sep 2020 15:49:49 +0000 (UTC)
Date: Mon, 28 Sep 2020 15:49:49 +0000
From: Frank van der Linden <fllinden@amazon.com>
To: Daire Byrne <daire@dneg.com>
Message-ID: <20200928154949.GA14702@dev-dsk-fllinden-2c-c1893d73.us-west-2.amazon.com>
References: <943482310.31162206.1599499860595.JavaMail.zimbra@dneg.com>
	<20200915172140.GA32632@fieldses.org>
	<2001715792.39705019.1600358470997.JavaMail.zimbra@dneg.com>
	<20200917190931.GA6858@fieldses.org>
	<20200917202303.GA29892@dev-dsk-fllinden-2c-c1893d73.us-west-2.amazon.com>
	<76A4DC7D-D4F7-4A17-A67D-282E8522132A@oracle.com>
	<1790619463.44171163.1600892707423.JavaMail.zimbra@dneg.com>
	<20200923210157.GA1650@dev-dsk-fllinden-2c-c1893d73.us-west-2.amazon.com>
	<108670779.52656705.1601110822013.JavaMail.zimbra@dneg.com>
MIME-Version: 1.0
In-Reply-To: <108670779.52656705.1601110822013.JavaMail.zimbra@dneg.com>
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
Cc: bfields <bfields@fieldses.org>, linux-cachefs <linux-cachefs@redhat.com>,
	linux-nfs <linux-nfs@vger.kernel.org>, Chuck Lever <chuck.lever@oracle.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Sep 26, 2020 at 10:00:22AM +0100, Daire Byrne wrote:
> 
> 
> ----- On 23 Sep, 2020, at 22:01, Frank van der Linden fllinden@amazon.com wrote:
> > It's entirely possible that my patch introduces a refcounting error - it was
> > intended as a proof-of-concept on how to fix the LRU locking issue for v4
> > open file caching (while keeping it enabled) - which is why I didn't
> > "formally" send it in.
> >
> > Having said that, I don't immediately see the problem.
> >
> > Maybe try it without the rhashtable patch, that is much less of an
> > optimization.
> >
> > The problem would have to be nf_ref as part of nfsd_file, or fi_ref as part
> > of nfs4_file. If it's the latter, it's probably the rhashtable change.
> 
> Thanks Frank; I think you are right in that it seems to be a problem with the rhashtable patch. Another 48 hours using the same workload with just the main patch and I have not seen the same issue again so far.
> 
> Also, it still has the effect of reducing the CPU usage dramatically such that there are plenty of cores still left idle. This is actually helping us buy some more time while we fix our obviously broken software so that it doesn't open/close so crazily.
> 
> So, many thanks for that.

Cool. I'm glad the "don't put v4 files on the LRU list" works as intended for
you. The rhashtable patch was more of an afterthought, and obviously has an
issue. It did provide some extra gains, so I'll see if I can find the problem
if I get some time.

Bruce - if you want me to 'formally' submit a version of the patch, let me
know. Just disabling the cache for v4, which comes down to reverting a few
commits, is probably simpler - I'd be able to test that too.

- Frank

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

