Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 905882B49F6
	for <lists+linux-cachefs@lfdr.de>; Mon, 16 Nov 2020 16:54:12 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-532-jD77S3ukPc6RVJvQZy96Ig-1; Mon, 16 Nov 2020 10:54:09 -0500
X-MC-Unique: jD77S3ukPc6RVJvQZy96Ig-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 446755F9C0;
	Mon, 16 Nov 2020 15:54:07 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E261B55764;
	Mon, 16 Nov 2020 15:54:06 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 039D058123;
	Mon, 16 Nov 2020 15:54:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AGFrcjb024902 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 16 Nov 2020 10:53:39 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id C3B372157F26; Mon, 16 Nov 2020 15:53:38 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BE7782157F4B
	for <linux-cachefs@redhat.com>; Mon, 16 Nov 2020 15:53:36 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 69DB090E424
	for <linux-cachefs@redhat.com>; Mon, 16 Nov 2020 15:53:36 +0000 (UTC)
Received: from fieldses.org (fieldses.org [173.255.197.46]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-176-2CAUwRfjMae87pXoho6yHg-1;
	Mon, 16 Nov 2020 10:53:30 -0500
X-MC-Unique: 2CAUwRfjMae87pXoho6yHg-1
Received: by fieldses.org (Postfix, from userid 2815)
	id 7A8201C15; Mon, 16 Nov 2020 10:53:29 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.11.0 fieldses.org 7A8201C15
Date: Mon, 16 Nov 2020 10:53:29 -0500
From: bfields <bfields@fieldses.org>
To: Daire Byrne <daire@dneg.com>
Message-ID: <20201116155329.GE898@fieldses.org>
References: <943482310.31162206.1599499860595.JavaMail.zimbra@dneg.com>
	<1744768451.86186596.1605186084252.JavaMail.zimbra@dneg.com>
	<20201112135733.GA9243@fieldses.org>
	<444227972.86442677.1605206025305.JavaMail.zimbra@dneg.com>
	<20201112205524.GI9243@fieldses.org>
	<883314904.86570901.1605222357023.JavaMail.zimbra@dneg.com>
	<20201113145050.GB1299@fieldses.org>
	<20201113222600.GC1299@fieldses.org>
	<217712894.87456370.1605358643862.JavaMail.zimbra@dneg.com>
MIME-Version: 1.0
In-Reply-To: <217712894.87456370.1605358643862.JavaMail.zimbra@dneg.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Nov 14, 2020 at 12:57:24PM +0000, Daire Byrne wrote:
> Now if anyone has any ideas why all the read calls to the originating
> server are limited to a maximum of 128k (with rsize=1M) when coming
> via the re-export server's nfsd threads, I see that as the next
> biggest performance issue. Reading directly on the re-export server
> with a userspace process issues 1MB reads as expected. It doesn't
> happen for writes (wsize=1MB all the way through) but I'm not sure if
> that has more to do with async and write back caching helping to build
> up the size before commit?

I'm not sure where to start with this one....

Is this behavior independent of protocol version and backend server?

> I figure the other remaining items on my (wish) list are probably more
> in the "won't fix" or "can't fix" category (except maybe the NFSv4.0
> input/output errors?).

Well, sounds like you've found a case where this feature's actually
useful.  We should make sure that's documented.

And I think it's also worth some effort to document and triage the list
of remaining issues.

--b.

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

