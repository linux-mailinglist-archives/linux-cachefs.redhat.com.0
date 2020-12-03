Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id E73322CDE03
	for <lists+linux-cachefs@lfdr.de>; Thu,  3 Dec 2020 19:51:36 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-564-bLlYJNBjNMePvYC20aW8LQ-1; Thu, 03 Dec 2020 13:51:34 -0500
X-MC-Unique: bLlYJNBjNMePvYC20aW8LQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 27F5B185E483;
	Thu,  3 Dec 2020 18:51:32 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7C5991A838;
	Thu,  3 Dec 2020 18:51:29 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3CA9A4BB7B;
	Thu,  3 Dec 2020 18:51:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0B3IpFEA015516 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 3 Dec 2020 13:51:16 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 89AE02166B27; Thu,  3 Dec 2020 18:51:15 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 849D72166B2B
	for <linux-cachefs@redhat.com>; Thu,  3 Dec 2020 18:51:13 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 53D46185A794
	for <linux-cachefs@redhat.com>; Thu,  3 Dec 2020 18:51:13 +0000 (UTC)
Received: from fieldses.org (fieldses.org [173.255.197.46]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-152-bHVXi0WfO7ye5iCBxl9kng-1;
	Thu, 03 Dec 2020 13:51:10 -0500
X-MC-Unique: bHVXi0WfO7ye5iCBxl9kng-1
Received: by fieldses.org (Postfix, from userid 2815)
	id 0289C6F5E; Thu,  3 Dec 2020 13:51:10 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.11.0 fieldses.org 0289C6F5E
Date: Thu, 3 Dec 2020 13:51:09 -0500
From: bfields <bfields@fieldses.org>
To: Daire Byrne <daire@dneg.com>
Message-ID: <20201203185109.GB27931@fieldses.org>
References: <943482310.31162206.1599499860595.JavaMail.zimbra@dneg.com>
	<279389889.68934777.1603124383614.JavaMail.zimbra@dneg.com>
	<635679406.70384074.1603272832846.JavaMail.zimbra@dneg.com>
	<20201109160256.GB11144@fieldses.org>
	<1744768451.86186596.1605186084252.JavaMail.zimbra@dneg.com>
	<1055884313.92996091.1606250106656.JavaMail.zimbra@dneg.com>
	<20201124211522.GC7173@fieldses.org>
	<932244432.93596532.1606324491501.JavaMail.zimbra@dneg.com>
	<1403656117.98163597.1606998035261.JavaMail.zimbra@dneg.com>
MIME-Version: 1.0
In-Reply-To: <1403656117.98163597.1606998035261.JavaMail.zimbra@dneg.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
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
Cc: linux-nfs <linux-nfs@vger.kernel.org>,
	linux-cachefs <linux-cachefs@redhat.com>,
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Dec 03, 2020 at 12:20:35PM +0000, Daire Byrne wrote:
> Just a small update based on the most recent patchsets from Trond &
> Bruce:
> 
> https://patchwork.kernel.org/project/linux-nfs/list/?series=393567
> https://patchwork.kernel.org/project/linux-nfs/list/?series=393561
> 
> For the write-through tests, the NFSv3 re-export of a NFSv4.2 server
> has trimmed an extra GETATTR:
> 
> Before: originating server <- (vers=4.2) <- reexport server - (vers=3)
> <- client writing = WRITE,COMMIT,GETATTR .... repeating
>  
> After: originating server <- (vers=4.2) <- reexport server - (vers=3)
> <- client writing = WRITE,COMMIT .... repeating
> 
> I'm assuming this is specifically due to the "EXPORT_OP_NOWCC" patch?

Probably so, thanks for the update.

> All other combinations look the same as before (for write-through). An
> NFSv4.2 re-export of a NFSv3 server is still the best/ideal in terms
> of not incurring extra metadata roundtrips when writing.
> 
> It's great to see this re-export scenario becoming a better supported
> (and performing) topology; many thanks all.

I've been scratching my head over how to handle reboot of a re-exporting
server.  I think one way to fix it might be just to allow the re-export
server to pass along reclaims to the original server as it receives them
from its own clients.  It might require some protocol tweaks, I'm not
sure.  I'll try to get my thoughts in order and propose something.

--b.

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

