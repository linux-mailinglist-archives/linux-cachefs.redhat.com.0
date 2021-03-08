Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 848553316F0
	for <lists+linux-cachefs@lfdr.de>; Mon,  8 Mar 2021 20:05:47 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-137-1fudl_KKOKu85xk3tH7UEA-1; Mon, 08 Mar 2021 14:05:44 -0500
X-MC-Unique: 1fudl_KKOKu85xk3tH7UEA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C8F3E2F7AA;
	Mon,  8 Mar 2021 19:05:40 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AA1DA10013D7;
	Mon,  8 Mar 2021 19:05:39 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 021C65002E;
	Mon,  8 Mar 2021 19:05:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 128J57hM004215 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 8 Mar 2021 14:05:07 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 396823053D; Mon,  8 Mar 2021 19:05:07 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 342B130508
	for <linux-cachefs@redhat.com>; Mon,  8 Mar 2021 19:05:05 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 14B11185A7BC
	for <linux-cachefs@redhat.com>; Mon,  8 Mar 2021 19:05:05 +0000 (UTC)
Received: from fieldses.org (fieldses.org [173.255.197.46]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-174-jBOHiMRvO3KaBpggcbm5Iw-1;
	Mon, 08 Mar 2021 14:05:01 -0500
X-MC-Unique: jBOHiMRvO3KaBpggcbm5Iw-1
Received: by fieldses.org (Postfix, from userid 2815)
	id B366F35BD; Mon,  8 Mar 2021 13:54:10 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.11.0 fieldses.org B366F35BD
Date: Mon, 8 Mar 2021 13:54:10 -0500
From: "J. Bruce Fields" <bfields@fieldses.org>
To: David Howells <dhowells@redhat.com>
Message-ID: <20210308185410.GE7284@fieldses.org>
References: <CAOQ4uxhxwKHLT559f8v5aFTheKgPUndzGufg0E58rkEqa9oQ3Q@mail.gmail.com>
	<2653261.1614813611@warthog.procyon.org.uk>
	<517184.1615194835@warthog.procyon.org.uk>
MIME-Version: 1.0
In-Reply-To: <517184.1615194835@warthog.procyon.org.uk>
User-Agent: Mutt/1.5.21 (2010-09-15)
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
Cc: CIFS <linux-cifs@vger.kernel.org>,
	Linux NFS Mailing List <linux-nfs@vger.kernel.org>,
	Miklos Szeredi <miklos@szeredi.hu>, Amir Goldstein <amir73il@gmail.com>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	"Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
	Christoph Hellwig <hch@infradead.org>, linux-cachefs@redhat.com,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Dave Chinner <dchinner@redhat.com>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	v9fs-developer@lists.sourceforge.net,
	ceph-devel <ceph-devel@vger.kernel.org>, linux-afs@lists.infradead.org
Subject: Re: [Linux-cachefs] fscache: Redesigning the on-disk cache
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-cachefs>, 
	<mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/linux-cachefs>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Sender: linux-cachefs-bounces@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Mar 08, 2021 at 09:13:55AM +0000, David Howells wrote:
> Amir Goldstein <amir73il@gmail.com> wrote:
> > With ->fiemap() you can at least make the distinction between a non existing
> > and an UNWRITTEN extent.
> 
> I can't use that for XFS, Ext4 or btrfs, I suspect.  Christoph and Dave's
> assertion is that the cache can't rely on the backing filesystem's metadata
> because these can arbitrarily insert or remove blocks of zeros to bridge or
> split extents.

Could you instead make some sort of explicit contract with the
filesystem?  Maybe you'd flag it at mkfs time and query for it before
allowing a filesystem to be used for fscache.  You don't need every
filesystem to support fscache, right, just one acceptable one?

--b.

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

