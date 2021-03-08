Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 95DBB331AE3
	for <lists+linux-cachefs@lfdr.de>; Tue,  9 Mar 2021 00:21:15 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-216-Zkj8_Z7RO7y1cX2iyiBZXQ-1; Mon, 08 Mar 2021 18:21:13 -0500
X-MC-Unique: Zkj8_Z7RO7y1cX2iyiBZXQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A8A6680432D;
	Mon,  8 Mar 2021 23:21:10 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 110E55D6D7;
	Mon,  8 Mar 2021 23:21:10 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A38021809C86;
	Mon,  8 Mar 2021 23:21:07 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 128NKper028429 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 8 Mar 2021 18:20:51 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 07820208C17A; Mon,  8 Mar 2021 23:20:51 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0298E2026D48
	for <linux-cachefs@redhat.com>; Mon,  8 Mar 2021 23:20:48 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6B7E1800B30
	for <linux-cachefs@redhat.com>; Mon,  8 Mar 2021 23:20:48 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-255-5n85PEYMMtOTk4ONGeJ1kA-1; Mon, 08 Mar 2021 18:20:44 -0500
X-MC-Unique: 5n85PEYMMtOTk4ONGeJ1kA-1
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
	Linux)) id 1lJPAg-00GbJf-5O; Mon, 08 Mar 2021 23:20:22 +0000
Date: Mon, 8 Mar 2021 23:20:18 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Dave Chinner <david@fromorbit.com>
Message-ID: <20210308232018.GG3479805@casper.infradead.org>
References: <CAOQ4uxjYWprb7trvamCx+DaP2yn8HCaZeZx1dSvPyFH2My303w@mail.gmail.com>
	<2653261.1614813611@warthog.procyon.org.uk>
	<CAOQ4uxhxwKHLT559f8v5aFTheKgPUndzGufg0E58rkEqa9oQ3Q@mail.gmail.com>
	<517184.1615194835@warthog.procyon.org.uk>
	<584529.1615202921@warthog.procyon.org.uk>
	<20210308223247.GB63242@dread.disaster.area>
MIME-Version: 1.0
In-Reply-To: <20210308223247.GB63242@dread.disaster.area>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: linux-cachefs@redhat.com
Cc: "J. Bruce Fields" <bfields@fieldses.org>,
	Linux NFS Mailing List <linux-nfs@vger.kernel.org>,
	Christoph Hellwig <hch@infradead.org>, CIFS <linux-cifs@vger.kernel.org>,
	Amir Goldstein <amir73il@gmail.com>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	Miklos Szeredi <miklos@szeredi.hu>, linux-cachefs@redhat.com,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Dave Chinner <dchinner@redhat.com>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	v9fs-developer@lists.sourceforge.net,
	ceph-devel <ceph-devel@vger.kernel.org>, linux-afs@lists.infradead.org
Subject: Re: [Linux-cachefs] Metadata writtenback notification? -- was Re:
 fscache: Redesigning the on-disk cache
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Mar 09, 2021 at 09:32:47AM +1100, Dave Chinner wrote:
> On Mon, Mar 08, 2021 at 11:28:41AM +0000, David Howells wrote:
> >      Possibly it's sufficient to just clear the excess page space before
> >      writing, but that doesn't necessarily stop a writable mmap from
> >      scribbling on it.
> 
> We can't stop mmap from scribbling in it. All filesystems have this
> problem, so to prevent data leaks we have to zero the post-eof tail
> region on every write of the EOF block, anyway.

That's certainly one approach.  Another would be to zero it during the I/O
completion handler.  It depends whether you can trust the last writer or
not (eg what do we do with an isofs file that happens to contain garbage
after the last byte in the file?)

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

