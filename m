Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id EF33326AAA2
	for <lists+linux-cachefs@lfdr.de>; Tue, 15 Sep 2020 19:30:02 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-320-KQSrrLAIMDGXnO7clRgsNA-1; Tue, 15 Sep 2020 13:30:00 -0400
X-MC-Unique: KQSrrLAIMDGXnO7clRgsNA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F3A7910BBED1;
	Tue, 15 Sep 2020 17:29:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2391A1992D;
	Tue, 15 Sep 2020 17:29:56 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E8BA944A56;
	Tue, 15 Sep 2020 17:29:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08FHTl6o003589 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 15 Sep 2020 13:29:48 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B22B920235B7; Tue, 15 Sep 2020 17:29:47 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AA6092024508
	for <linux-cachefs@redhat.com>; Tue, 15 Sep 2020 17:29:43 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6230F80096B
	for <linux-cachefs@redhat.com>; Tue, 15 Sep 2020 17:29:43 +0000 (UTC)
Received: from fieldses.org (fieldses.org [173.255.197.46]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-448-glc5ejYoOwibKepkdWC4nQ-1;
	Tue, 15 Sep 2020 13:29:39 -0400
X-MC-Unique: glc5ejYoOwibKepkdWC4nQ-1
Received: by fieldses.org (Postfix, from userid 2815)
	id 915E67EC; Tue, 15 Sep 2020 13:21:40 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 fieldses.org 915E67EC
Date: Tue, 15 Sep 2020 13:21:40 -0400
To: Daire Byrne <daire@dneg.com>
Message-ID: <20200915172140.GA32632@fieldses.org>
References: <943482310.31162206.1599499860595.JavaMail.zimbra@dneg.com>
MIME-Version: 1.0
In-Reply-To: <943482310.31162206.1599499860595.JavaMail.zimbra@dneg.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
From: bfields@fieldses.org (J. Bruce Fields)
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: linux-cachefs@redhat.com
Cc: linux-nfs@vger.kernel.org, linux-cachefs@redhat.com
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Mon, Sep 07, 2020 at 06:31:00PM +0100, Daire Byrne wrote:
> 1) The kernel can drop entries out of the NFS client inode cache (under memory cache churn) when those filehandles are still being used by the knfsd's remote clients resulting in sporadic and random stale filehandles. This seems to be mostly for directories from what I've seen. Does the NFS client not know that knfsd is still using those files/dirs? The workaround is to never drop inode & dentry caches on the re-export servers (vfs_cache_pressure=1). This also helps to ensure that we actually make the most of our actimeo=3600,nocto mount options for the full specified time.

I thought reexport worked by embedding the original server's filehandles
in the filehandles given out by the reexporting server.

So, even if nothing's cached, when the reexporting server gets a
filehandle, it should be able to extract the original filehandle from it
and use that.

I wonder why that's not working?

> 4) With an NFSv4 re-export, lots of open/close requests (hundreds per
> second) quickly eat up the CPU on the re-export server and perf top
> shows we are mostly in native_queued_spin_lock_slowpath.

Any statistics on who's calling that function?

> Does NFSv4
> also need an open file cache like that added to NFSv3? Our workaround
> is to either fix the thing doing lots of repeated open/closes or use
> NFSv3 instead.

NFSv4 uses the same file cache.  It might be the file cache that's at
fault, in fact....

--b.

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

