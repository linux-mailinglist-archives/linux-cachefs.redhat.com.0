Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id DBC8C2BC2CC
	for <lists+linux-cachefs@lfdr.de>; Sun, 22 Nov 2020 01:02:40 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-391-4Rz_RFojMD6LyZ7nRFNCEw-1; Sat, 21 Nov 2020 19:02:37 -0500
X-MC-Unique: 4Rz_RFojMD6LyZ7nRFNCEw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 90EDB1005D7A;
	Sun, 22 Nov 2020 00:02:34 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4A89D5D9DB;
	Sun, 22 Nov 2020 00:02:32 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 958244A7C6;
	Sun, 22 Nov 2020 00:02:30 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AM02Qsj011242 for <linux-cachefs@listman.util.phx.redhat.com>;
	Sat, 21 Nov 2020 19:02:26 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 0BD385D22C; Sun, 22 Nov 2020 00:02:26 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 064965D22E
	for <linux-cachefs@redhat.com>; Sun, 22 Nov 2020 00:02:24 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DFE10800B3A
	for <linux-cachefs@redhat.com>; Sun, 22 Nov 2020 00:02:23 +0000 (UTC)
Received: from fieldses.org (fieldses.org [173.255.197.46]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-413-CcSRK71cMUm5CBcMq3yt4Q-1;
	Sat, 21 Nov 2020 19:02:18 -0500
X-MC-Unique: CcSRK71cMUm5CBcMq3yt4Q-1
Received: by fieldses.org (Postfix, from userid 2815)
	id ACC146E9D; Sat, 21 Nov 2020 19:02:16 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.11.0 fieldses.org ACC146E9D
Date: Sat, 21 Nov 2020 19:02:16 -0500
From: bfields <bfields@fieldses.org>
To: Daire Byrne <daire@dneg.com>
Message-ID: <20201122000216.GE3476@fieldses.org>
References: <20201117031601.GB10526@fieldses.org>
	<1605583086-19869-2-git-send-email-bfields@redhat.com>
	<a5704a8f7a6ebdfa60d4fa996a4d9ebaacc7daaf.camel@kernel.org>
	<20201117152636.GC4556@fieldses.org>
	<725499c144317aac1a03f0334a22005588dbdefc.camel@kernel.org>
	<20201120223831.GB7705@fieldses.org>
	<20201120224438.GC7705@fieldses.org>
	<5f8e9e0cb53c89a7d1c156a6799c6dbc6db96dae.camel@kernel.org>
	<1758069641.91412432.1605995069116.JavaMail.zimbra@dneg.com>
MIME-Version: 1.0
In-Reply-To: <1758069641.91412432.1605995069116.JavaMail.zimbra@dneg.com>
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
Cc: "J. Bruce Fields" <bfields@redhat.com>,
	linux-nfs <linux-nfs@vger.kernel.org>,
	linux-cachefs <linux-cachefs@redhat.com>, Jeff Layton <jlayton@kernel.org>,
	Trond Myklebust <trondmy@hammerspace.com>
Subject: Re: [Linux-cachefs] [PATCH 2/4] nfsd: pre/post attr is using wrong
	change attribute
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Nov 21, 2020 at 09:44:29PM +0000, Daire Byrne wrote:
> ----- On 21 Nov, 2020, at 01:03, Jeff Layton jlayton@kernel.org wrote:
> > On Fri, 2020-11-20 at 17:44 -0500, J. Bruce Fields wrote:
> >> On Fri, Nov 20, 2020 at 05:38:31PM -0500, J. Bruce Fields wrote:
> >> > I think the first one's all that's needed to fix the problem Daire
> >> > identified.  I'm a little less sure of the rest.
> 
> I can confirm that patch 1/8 alone does indeed address the reported revalidation issue for us (as did the previous patch). The re-export server's client cache seems to remain intact and can serve the same cached results to multiple clients.

Thanks again for the testing.

> I should also mention that I still see a lot of unexpected repeat
> lookups even with the iversion optimisation patches with certain
> workloads. For example, looking at a network capture on the re-export
> server I might see 100s of getattr calls to the originating server for
> the same filehandle within 30 seconds which I would have expected the
> client cache to serve. But it could also be that the client cache is
> under memory pressure and not holding that data for very long.

That sounds weird.  Is the filehandle for a file or a directory?  Is the
file or directory actually changing at the time, and if so, is it the
client that's changing it?

Remind me what the setup is--a v3 re-export of a v4 mount?

--b.

> But now I do wonder if these NFSv4 directory modifications and
> pre/post change attributes could be one potential contributor? I might
> run some production loads with a v3 re-export of a v3 server to see if
> that changes anything.
> 
> Many thanks again for the patches, I will take the entire set and run
> them through our production re-export workloads to see if anything
> shakes out.
> 
> Daire

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

