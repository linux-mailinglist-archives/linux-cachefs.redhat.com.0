Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 8DFDA2B0FA9
	for <lists+linux-cachefs@lfdr.de>; Thu, 12 Nov 2020 21:55:45 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-590-pccAzH5NPPaZYgheHf0PlA-1; Thu, 12 Nov 2020 15:55:43 -0500
X-MC-Unique: pccAzH5NPPaZYgheHf0PlA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 00DA5425F9;
	Thu, 12 Nov 2020 20:55:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4894B5D9CA;
	Thu, 12 Nov 2020 20:55:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 43295996C;
	Thu, 12 Nov 2020 20:55:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0ACKtWAs032192 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 12 Nov 2020 15:55:32 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 1A1D8202348E; Thu, 12 Nov 2020 20:55:32 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 15A41202450E
	for <linux-cachefs@redhat.com>; Thu, 12 Nov 2020 20:55:29 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B5D58811E76
	for <linux-cachefs@redhat.com>; Thu, 12 Nov 2020 20:55:29 +0000 (UTC)
Received: from fieldses.org (fieldses.org [173.255.197.46]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-105-nDLI55fvPamJUajT2wwdsg-1;
	Thu, 12 Nov 2020 15:55:25 -0500
X-MC-Unique: nDLI55fvPamJUajT2wwdsg-1
Received: by fieldses.org (Postfix, from userid 2815)
	id 9F67940B5; Thu, 12 Nov 2020 15:55:24 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.11.0 fieldses.org 9F67940B5
Date: Thu, 12 Nov 2020 15:55:24 -0500
From: bfields <bfields@fieldses.org>
To: Daire Byrne <daire@dneg.com>
Message-ID: <20201112205524.GI9243@fieldses.org>
References: <943482310.31162206.1599499860595.JavaMail.zimbra@dneg.com>
	<4d1d7cd0076d98973a56e89c92e4ff0474aa0e14.camel@hammerspace.com>
	<1188023047.38703514.1600272094778.JavaMail.zimbra@dneg.com>
	<279389889.68934777.1603124383614.JavaMail.zimbra@dneg.com>
	<635679406.70384074.1603272832846.JavaMail.zimbra@dneg.com>
	<20201109160256.GB11144@fieldses.org>
	<1744768451.86186596.1605186084252.JavaMail.zimbra@dneg.com>
	<20201112135733.GA9243@fieldses.org>
	<444227972.86442677.1605206025305.JavaMail.zimbra@dneg.com>
MIME-Version: 1.0
In-Reply-To: <444227972.86442677.1605206025305.JavaMail.zimbra@dneg.com>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Nov 12, 2020 at 06:33:45PM +0000, Daire Byrne wrote:
> Well, yes NFSv4.2 all the way through works well for us but it's re-exporting a NFSv4.0 server (Linux OR Netapp) that seems to still show the input/output errors when dropping caches. Every other possible combination now seems to be working without ESTALE or input/errors with the lookupp emulation patches.
> 
> So this is still not working when dropping caches on the re-export server:
> 
> 		NFSv3/4.x			  NFSv4.0
> 	client --------> re-export server -------> original server
> 
> The bit specific to the Netapp is simply that our 7-mode only supports NFSv4.0 so I can't actually test NFSv4.1/4.2 on a more modern Netapp firmware release. So I have to use NFSv3 to mount the Netapp and can then happily re-export that using NFSv4.x or NFSv3 (if the filehandles fit in 63 bytes).

Oh, got it, thanks, so it's just the minor-version difference (probably
the open-by-filehandle stuff that went into 4.1).

> There was some discussion about NFS4_CHANGE_TYPE_IS_MONOTONIC_INCR
> allowing for the hack/optimisation but I guess that is only for the
> case when re-exporting NFSv4 to the eventual clients. It would not
> help if you were re-exporting an NFSv3 server with NFSv3 to the
> clients? I lack the deeper understanding to say anything more than
> that.

Oh, right, thanks for the reminder.  The CHANGE_TYPE_IS_MONOTONIC_INCR
optimization still looks doable to me.

How does that help, anyway?  I guess it avoids false positives of some
kind when rpc's are processed out of order?

Looking back at

	https://lore.kernel.org/linux-nfs/1155061727.42788071.1600777874179.JavaMail.zimbra@dneg.com/

this bothers me: "I'm not exactly sure why, but the iversion of the
inode gets changed locally (due to atime modification?) most likely via
invocation of method inode_inc_iversion_raw. Each time it gets
incremented the following call to validate attributes detects changes
causing it to be reloaded from the originating server."

The only call to that function outside afs or ceph code is in
fs/nfs/write.c, in the write delegation case.  The Linux server doesn't
support write delegations, Netapp does but this shouldn't be causing
cache invalidations.

--b.

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

