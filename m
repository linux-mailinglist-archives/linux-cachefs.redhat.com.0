Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 6C8B82C3263
	for <lists+linux-cachefs@lfdr.de>; Tue, 24 Nov 2020 22:15:39 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-331-xbTPuAL9N5SNaYnlyqr4AA-1; Tue, 24 Nov 2020 16:15:36 -0500
X-MC-Unique: xbTPuAL9N5SNaYnlyqr4AA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C0389E743;
	Tue, 24 Nov 2020 21:15:33 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 33E0A5C1A1;
	Tue, 24 Nov 2020 21:15:33 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 57C36180954D;
	Tue, 24 Nov 2020 21:15:32 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AOLFTXr020807 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 24 Nov 2020 16:15:29 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 61B78110E986; Tue, 24 Nov 2020 21:15:29 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5E01C110E984
	for <linux-cachefs@redhat.com>; Tue, 24 Nov 2020 21:15:27 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F3F82811E84
	for <linux-cachefs@redhat.com>; Tue, 24 Nov 2020 21:15:26 +0000 (UTC)
Received: from fieldses.org (fieldses.org [173.255.197.46]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-545-TZEVQTwrOQOsCt8UwKyFYQ-1;
	Tue, 24 Nov 2020 16:15:23 -0500
X-MC-Unique: TZEVQTwrOQOsCt8UwKyFYQ-1
Received: by fieldses.org (Postfix, from userid 2815)
	id 4EBF06EA0; Tue, 24 Nov 2020 16:15:22 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.11.0 fieldses.org 4EBF06EA0
Date: Tue, 24 Nov 2020 16:15:22 -0500
From: bfields <bfields@fieldses.org>
To: Daire Byrne <daire@dneg.com>
Message-ID: <20201124211522.GC7173@fieldses.org>
References: <943482310.31162206.1599499860595.JavaMail.zimbra@dneg.com>
	<20200915172140.GA32632@fieldses.org>
	<4d1d7cd0076d98973a56e89c92e4ff0474aa0e14.camel@hammerspace.com>
	<1188023047.38703514.1600272094778.JavaMail.zimbra@dneg.com>
	<279389889.68934777.1603124383614.JavaMail.zimbra@dneg.com>
	<635679406.70384074.1603272832846.JavaMail.zimbra@dneg.com>
	<20201109160256.GB11144@fieldses.org>
	<1744768451.86186596.1605186084252.JavaMail.zimbra@dneg.com>
	<1055884313.92996091.1606250106656.JavaMail.zimbra@dneg.com>
MIME-Version: 1.0
In-Reply-To: <1055884313.92996091.1606250106656.JavaMail.zimbra@dneg.com>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Nov 24, 2020 at 08:35:06PM +0000, Daire Byrne wrote:
> Sometimes I have seen clusters of 16 GETATTRs for the same file on the
> wire with nothing else inbetween. So if the re-export server is the
> only "client" writing these files to the originating server, why do we
> need to do so many repeat GETATTR calls when using nconnect>1? And why
> are the COMMIT calls required when the writes are coming via nfsd but
> not from userspace on the re-export server? Is that due to some sort
> of memory pressure or locking?
> 
> I picked the NFSv3 originating server case because my head starts to
> hurt tracking the equivalent packets, stateids and compound calls with
> NFSv4. But I think it's mostly the same for NFSv4. The writes through
> the re-export server lead to lots of COMMITs and (double) GETATTRs but
> using nconnect>1 at least doesn't seem to make it any worse like it
> does for NFSv3.
> 
> But maybe you actually want all the extra COMMITs to help better
> guarantee your writes when putting a re-export server in the way?
> Perhaps all of this is by design...

Maybe that's close-to-open combined with the server's tendency to
open/close on every IO operation?  (Though the file cache should have
helped with that, I thought; as would using version >=4.0 on the final
client.)

Might be interesting to know whether the nocto mount option makes a
difference.  (So, add "nocto" to the mount options for the NFS mount
that you're re-exporting on the re-export server.)

By the way I made a start at a list of issues at

	http://wiki.linux-nfs.org/wiki/index.php/NFS_re-export

but I was a little vague on which of your issues remained and didn't
take much time over it.

(If you want an account on that wiki BTW I seem to recall you just have
to ask Trond (for anti-spam reasons).)

--b.

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

