Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 536DF2B1DB4
	for <lists+linux-cachefs@lfdr.de>; Fri, 13 Nov 2020 15:51:16 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-206-YTisr6vcPF6BVghftijLNw-1; Fri, 13 Nov 2020 09:51:12 -0500
X-MC-Unique: YTisr6vcPF6BVghftijLNw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7CF6E1018F72;
	Fri, 13 Nov 2020 14:51:09 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 616BB6E732;
	Fri, 13 Nov 2020 14:51:06 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EC58B58103;
	Fri, 13 Nov 2020 14:51:00 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0ADEouMM015992 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 13 Nov 2020 09:50:57 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id A7F6C2023451; Fri, 13 Nov 2020 14:50:56 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A15F2205EAE6
	for <linux-cachefs@redhat.com>; Fri, 13 Nov 2020 14:50:54 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 539AF8582B1
	for <linux-cachefs@redhat.com>; Fri, 13 Nov 2020 14:50:54 +0000 (UTC)
Received: from fieldses.org (fieldses.org [173.255.197.46]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-474-WrC9NzntOuClPA7TcBlU-Q-1;
	Fri, 13 Nov 2020 09:50:51 -0500
X-MC-Unique: WrC9NzntOuClPA7TcBlU-Q-1
Received: by fieldses.org (Postfix, from userid 2815)
	id E4A89BC8; Fri, 13 Nov 2020 09:50:50 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.11.0 fieldses.org E4A89BC8
Date: Fri, 13 Nov 2020 09:50:50 -0500
From: bfields <bfields@fieldses.org>
To: Daire Byrne <daire@dneg.com>
Message-ID: <20201113145050.GB1299@fieldses.org>
References: <943482310.31162206.1599499860595.JavaMail.zimbra@dneg.com>
	<279389889.68934777.1603124383614.JavaMail.zimbra@dneg.com>
	<635679406.70384074.1603272832846.JavaMail.zimbra@dneg.com>
	<20201109160256.GB11144@fieldses.org>
	<1744768451.86186596.1605186084252.JavaMail.zimbra@dneg.com>
	<20201112135733.GA9243@fieldses.org>
	<444227972.86442677.1605206025305.JavaMail.zimbra@dneg.com>
	<20201112205524.GI9243@fieldses.org>
	<883314904.86570901.1605222357023.JavaMail.zimbra@dneg.com>
MIME-Version: 1.0
In-Reply-To: <883314904.86570901.1605222357023.JavaMail.zimbra@dneg.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Nov 12, 2020 at 11:05:57PM +0000, Daire Byrne wrote:
> So, I can't lay claim to identifying the exact optimisation/hack that
> improves the retention of the re-export server's client cache when
> re-exporting an NFSv3 server (which is then read by many clients). We
> were working with an engineer at the time who showed an interest in
> our use case and after we supplied a reproducer he suggested modifying
> the nfs/inode.c
> 
> -		if (!inode_eq_iversion_raw(inode, fattr->change_attr)) {
> +		if (inode_peek_iversion_raw(inode) < fattr->change_attr)
> {
> 
> His reasoning at the time was:
> 
> "Fixes inode invalidation caused by read access. The least important
> bit is ORed with 1 and causes the inode version to differ from the one
> seen on the NFS share. This in turn causes unnecessary re-download
> impacting the performance significantly. This fix makes it only
> re-fetch file content if inode version seen on the server is newer
> than the one on the client."
> 
> But I've always been puzzled by why this only seems to be the case
> when using knfsd to re-export the (NFSv3) client mount. Using multiple
> processes on a standard client mount never causes any similar
> re-validations. And this happens with a completely read-only share
> which is why I started to think it has something to do with atimes as
> that could perhaps still cause a "write" modification even when
> read-only?

Ah-hah!  So, it's inode_query_iversion() that's modifying a nfs inode's
i_version.  That's a special thing that only nfsd would do.

I think that's totally fixable, we'll just have to think a little about
how....

--b.

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

