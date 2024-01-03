Return-Path: <linux-cachefs+bncBDLIXLMFVAERBDFL2WWAMGQELN2FLMQ@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	by mail.lfdr.de (Postfix) with ESMTPS id 943C5822D40
	for <lists+linux-cachefs@lfdr.de>; Wed,  3 Jan 2024 13:39:41 +0100 (CET)
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-5eb6dba1796sf144175757b3.1
        for <lists+linux-cachefs@lfdr.de>; Wed, 03 Jan 2024 04:39:41 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1704285580; cv=pass;
        d=google.com; s=arc-20160816;
        b=S7fHyN9pIPM9SsaE395cupAD2f+zSKl3FtlRGIINF6DYmbAaps+IG/XNSBiEthV9PL
         1rmbvIitnF9G7JkVE9XYjd1Ti6TE3AqHUyG13Dj2mFWovsUnrLoYUmIywj42FOoE7Lzh
         3LsVQfr5Eh43WdqIYf7gApNl3qwH2CTkjBdill6lCzsPMOaiMVCF+4rMN7LQCR7xpvsu
         BunEBOz/YQmMVazu1WxRehs7o06IWRcViwRLEkmHd2yrDxEyY9BSonOXqujAyR5PP71O
         szfGjZhIYMBKMBhPjmVYgUk1Wn4Xr1sMHAkiWP6AZ9Bs7rcLnW4DbI44y+57H+wIoPrL
         Lk2Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:content-id:message-id:date:mime-version
         :subject:cc:to:references:in-reply-to:from:organization:delivered-to;
        bh=fjPCYatyioKDCVkWeWT1+iRxW3y990vx+hBOWMxrW0E=;
        fh=iO1mnNj3+QcY16QMX2pVt5CjcQ/HcrO90z/0VmpgPXI=;
        b=T7a65+EOuC8PEz3XL6QFTfpl7z6l+0NkRR7ZN/+sKbwAPPGn45PVlPppCEu2F+SnX1
         UIzcjzJhXYlEo6E2tSbZtWif44z3+LuIJmLMvDoMXFLGdKLSI3/4DspR6P2YgSJ2bEHu
         zLxrgfM0K6XpxrkBFU04nUZRf/+WdWPf38dQfs7EkOjWoA7aHyw46MFsJImQ0UCOaNSl
         TwQgdrvLwDe7Z9Whqd9XwpkXGumQiJt7pNZMov6nTuIhfw7/pepGjrv5j5HKp+merMsl
         yrWhPukwiyuBHtRjm2tWgmgsYhPcNMScvnpBDcJO2z8xY/EZ7PR9akxgCI4YGZBGEj4T
         4feg==
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704285580; x=1704890380;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:content-id
         :message-id:date:mime-version:subject:cc:to:references:in-reply-to
         :from:organization:delivered-to:x-beenthere:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fjPCYatyioKDCVkWeWT1+iRxW3y990vx+hBOWMxrW0E=;
        b=c4/Yvl6udsribSbPtMOFpiOmoBcWX4QT98VqeIYRi15QaDt30lbTqUvEfJ37xR1VRb
         7TGGLglz1wQjHS+q8XCZ66BB4spNXILup4iyRH8QJcbyI+wq9t5tmmJx0y2fIprtXEJu
         vS79afmxauWoglQJ1CARg+BHhX0WndyVGASpVh0C8xuD22m/EWlDhCv9CZKiPjYwxo4B
         HF8e1ypzOhykOhDyfDVicJQKte89BCAqnHlyxSHfzBKnszDicKZvJGBAgArXbvYe7aej
         0WM3yIg6Ez+3ckp3bBqI/6Kf2SLOpmZJZxr+d7fC7FPDG2fhNXdbYPn0eMkBvCQYaI+v
         Vcjg==
X-Gm-Message-State: AOJu0YxtWCedl2wt92ocssr5kasz6NpNgJWUR0qjr/6O8tOaV8IjLUy8
	CBN5HAhT1jSW3H7+yaSjD7hXvdb2zXl1bw==
X-Google-Smtp-Source: AGHT+IE4y/jWDM3yNDKMB1qqxlGjHuXCwvkRr6UFLxWwjTYAbvDKK7DtymN49oX4lvzBysjPvj0sxw==
X-Received: by 2002:a05:6902:102:b0:dbe:a323:ad49 with SMTP id o2-20020a056902010200b00dbea323ad49mr370414ybh.80.1704285580336;
        Wed, 03 Jan 2024 04:39:40 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a25:d786:0:b0:dbd:5b60:bcff with SMTP id o128-20020a25d786000000b00dbd5b60bcffls2191904ybg.2.-pod-prod-06-us;
 Wed, 03 Jan 2024 04:39:39 -0800 (PST)
X-Received: by 2002:a05:690c:290b:b0:5e9:fa4a:fd56 with SMTP id eg11-20020a05690c290b00b005e9fa4afd56mr9600064ywb.13.1704285579686;
        Wed, 03 Jan 2024 04:39:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704285579; cv=none;
        d=google.com; s=arc-20160816;
        b=aRsgEfwYnRdiSbV1lZer1vSgqr6GRoMHIT5itA+TXfM9xYDpqKonDy0o3aSxSFCLob
         2wW3rFSl2QgBvUjMUhJJbfXGI+Ij74iuEejEXz40A57RxjYCGrPNsN3T4PKfYiERNIC7
         GPD7E7jfz/H+0Oiqq2bQjW8rjayV1i9nRFaUgb3oK1WHae8PqR0fOxjvYo3sr/r26I+F
         fOlwcaG4GF5/TQR6EGdAaW4E9mqWF0GZFgDYuYVcFX/v08oN03NlZkU6QzXMcN9N3VPJ
         yCCaMhtwAWF8E5qOrOq9XmfHyMaGTBVAmnTZ39Cm+GD6CNmy8C6doq4UGXbk9cf/rmw4
         SZIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-id:message-id:date:mime-version
         :subject:cc:to:references:in-reply-to:from:organization:delivered-to;
        bh=Z+OBVCoOqLODk6Wqqvs+79jWwODyD1k+mw0CkDLgZD0=;
        fh=iO1mnNj3+QcY16QMX2pVt5CjcQ/HcrO90z/0VmpgPXI=;
        b=t7Bo9t5pdNoxF6CCgIeGl6V4/HMFHzY1XORbLBtOP0lvEwCxayRU1Kt5WYr6WoezI5
         riJsVrzXocKDuU4zYiUdx2noIIhb5ETjCStDZ2RrWTAXjuMWcXHnFe344hMwQ4Vm+N0u
         YhENHCbVYeVVrfFr+LjsPXUe504j4Y32YHAe5kRRnRxx6gOCoijao+jwvG9agXAHvOpx
         DCsnOuGiUvqorL9A8qAtQ4l+19b5h/WGIQskWPeFsXyRpAcUE1Lyol/KErvzZ99Z6tvm
         5A8PBojiK+mDXfyqaFVel2avU6suCzyi/WIQYM6Dcz6Y1aE034mD+8kOOL+KSsXEa62g
         A/XA==
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id o9-20020ac87c49000000b0042836ec0095si1255640qtv.81.2024.01.03.04.39.39
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jan 2024 04:39:39 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-312-vQ6IAXwYNKu7e1bczigFrQ-1; Wed, 03 Jan 2024 07:39:38 -0500
X-MC-Unique: vQ6IAXwYNKu7e1bczigFrQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 111FC10193A6
	for <linux-cachefs@gapps.redhat.com>; Wed,  3 Jan 2024 12:39:38 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 0E368C159B0; Wed,  3 Jan 2024 12:39:38 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.42.28.68])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E3D15C15A0C;
	Wed,  3 Jan 2024 12:39:34 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <ZZULNQAZ0n0WQv7p@codewreck.org>
References: <ZZULNQAZ0n0WQv7p@codewreck.org> <20231221132400.1601991-1-dhowells@redhat.com> <20231221132400.1601991-41-dhowells@redhat.com>
To: Dominique Martinet <asmadeus@codewreck.org>
Cc: dhowells@redhat.com, Jeff Layton <jlayton@kernel.org>,
    Steve French <smfrench@gmail.com>,
    Matthew Wilcox <willy@infradead.org>,
    Marc Dionne <marc.dionne@auristor.com>,
    Paulo Alcantara <pc@manguebit.com>,
    Shyam Prasad N <sprasad@microsoft.com>, Tom Talpey <tom@talpey.com>,
    Eric Van Hensbergen <ericvh@kernel.org>,
    Ilya Dryomov <idryomov@gmail.com>,
    Christian Brauner <christian@brauner.io>, linux-cachefs@redhat.com,
    linux-afs@lists.infradead.org, linux-cifs@vger.kernel.org,
    linux-nfs@vger.kernel.org, ceph-devel@vger.kernel.org,
    v9fs@lists.linux.dev, linux-fsdevel@vger.kernel.org,
    linux-mm@kvack.org, netdev@vger.kernel.org,
    linux-kernel@vger.kernel.org, Latchesar Ionkov <lucho@ionkov.net>,
    Christian Schoenebeck <linux_oss@crudebyte.com>
Subject: Re: [PATCH v5 40/40] 9p: Use netfslib read/write_iter
MIME-Version: 1.0
Date: Wed, 03 Jan 2024 12:39:34 +0000
Message-ID: <355430.1704285574@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-ID: <355429.1704285574.1@warthog.procyon.org.uk>
X-Original-Sender: dhowells@redhat.com
X-Original-Authentication-Results: mx.google.com;       gateway.spf=pass
 (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal
 address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
Precedence: list
Mailing-list: list linux-cachefs@redhat.com; contact linux-cachefs+owners@redhat.com
List-ID: <linux-cachefs.redhat.com>
X-Spam-Checked-In-Group: linux-cachefs@redhat.com
X-Google-Group-Id: 998933772329
List-Post: <https://groups.google.com/a/redhat.com/group/linux-cachefs/post>, <mailto:linux-cachefs@redhat.com>
List-Help: <https://support.google.com/a/redhat.com/bin/topic.py?topic=25838>, <mailto:linux-cachefs+help@redhat.com>
List-Archive: <https://groups.google.com/a/redhat.com/group/linux-cachefs/>
List-Unsubscribe: <mailto:googlegroups-manage+998933772329+unsubscribe@googlegroups.com>,
 <https://groups.google.com/a/redhat.com/group/linux-cachefs/subscribe>

Dominique Martinet <asmadeus@codewreck.org> wrote:

> > +static void v9fs_upload_to_server(struct netfs_io_subrequest *subreq)
> > +{
> > +	struct inode *inode = subreq->rreq->inode;
> > +	struct v9fs_inode __maybe_unused *v9inode = V9FS_I(inode);
> 
> Any reason to have this variable assignment at all?

I'll just remove it.  The __maybe_unused suppressed the warning, otherwise I'd
have removed it already.

> p9_client_write return value should always be subreq->len, but I believe
> we should use it unless err is set.
> (It's also possible for partial writes to happen, e.g. p9_client_write
> looped a few times and then failed, at which point the size returned
> would be the amount that actually got through -- we probably should do
> something with that?)

How about something like:

-	int err;
+	int err, len;
 
 	trace_netfs_sreq(subreq, netfs_sreq_trace_submit);
-	p9_client_write(fid, subreq->start, &subreq->io_iter, &err);
-	netfs_write_subrequest_terminated(subreq, err < 0 ? err : subreq->len,
-					  false);
+	len = p9_client_write(fid, subreq->start, &subreq->io_iter, &err);
+	netfs_write_subrequest_terminated(subreq, len ?: err, false);

> > +	total = p9_client_read(fid, subreq->start + subreq->transferred,
> > +			       &subreq->io_iter, &err);
> 
> Just to clarify: subreq->io_iter didn't exist (or some conditions to use
> it weren't cleared) before?

Correct.  It's added in the netfs-lib patches.  I've provided a way to
separate the user-side iterator from the I/O-side iterator to allow the use of
a bounce buffer for the purpose of content crypto, compression or just having
to deal with RMW cycles to a larger block size on the server.

> > +	if (file) {
> > +		fid = file->private_data;
> > +		BUG_ON(!fid);
> 
> This probably should be WARN + return EINVAL like find by inode?
> It's certainly a huge problem, but we should avoid BUG if possible...

Sure.  The BUG_ON() was already there, but I can turn it into a WARN+error.

> nit: not sure what's cleaner?
> Since there's a message that makes for a bit awkward if...
> 
> if (WARN_ONCE(!fid, "folio expected an open fid inode->i_private=%p\n",
> 	      rreq->inode->i_private))
> 	return -EINVAL;
> 
> (as a side note, I'm not sure what to make of this i_private pointer
> here, but if that'll help you figure something out sure..)

Um.  9p is using i_private.  But perhaps i_ino would be a better choice:

	if (file) {
		fid = file->private_data;
		if (!fid)
			goto no_fid;
		p9_fid_get(fid);
	} else {
		fid = v9fs_fid_find_inode(rreq->inode, writing, INVALID_UID, true);
		if (!fid)
			goto no_fid;
	}

	...

no_fid:
	WARN_ONCE(1, "folio expected an open fid inode->i_ino=%lx\n",
		  rreq->inode->i_ino);
	return -EINVAL;

> This is as follow on your netfs-lib branch:
> -       WARN_ON(rreq->origin == NETFS_READ_FOR_WRITE &&
> -                       !(fid->mode & P9_ORDWR));
> -
> -       p9_fid_get(fid);
> +       WARN_ON(rreq->origin == NETFS_READ_FOR_WRITE && !(fid->mode & P9_ORDWR));
> 
> So the WARN_ON has been reverted back with only indentation changed;
> I guess there were patterns that were writing despite the fid not having
> been open as RDWR?
> Do you still have details about these?

The condition in the WARN_ON() here got changed.  It was:

	WARN_ON(writing && ...

at one point, but that caused a bunch of incorrect warning to appear because
only NETFS_READ_FOR_WRITE requires read-access as well as write-access.  All
the others:

	bool writing = (rreq->origin == NETFS_READ_FOR_WRITE ||
			rreq->origin == NETFS_WRITEBACK ||
			rreq->origin == NETFS_WRITETHROUGH ||
			rreq->origin == NETFS_LAUNDER_WRITE ||
			rreq->origin == NETFS_UNBUFFERED_WRITE ||
			rreq->origin == NETFS_DIO_WRITE);

only require write-access.

There will be an additional one if we roll out content crypto to 9p as we may
need to do RMW cycles occasionally - but that's off to one side just for the
moment.

> If a file has been open without the write bit it might not go through,
> and it's incredibly difficult to get such users back to userspace in
> async cases (e.g. mmap flushes), so would like to understand that.

The VFS/VM should prevent writing to files that aren't open O_WRONLY or
O_RDWR, so I don't think we should be called in otherwise.

Note that I'm intending to change the way fscache is driven when we fetch
cacheable data from the server so that I can free up the PG_fscache bit and
return it to the MM folks.  Instead of marking the page PG_fscache, I mark it
PG_dirty and set page->private with a special value to indicate it should only
be written to the cache - then the writepages sees that and just writes these
pages to the cache.  I have a patch to do this and it seems to work, but I
need to make ceph and cifs use netfslib before I can apply it.

> > +	p9_debug(P9_DEBUG_VFS, "(cached)\n");
> 
> (Not a new problem so no need to address here, but having just
> "(cached)" on a split line is a bit weird.. We first compute cached or
> not as a bool and make it %s + cached ? " (cached)" : "" or
> something... I'll send a patch after this gets in to avoid conflicts)

Okay.

> > +	return netfs_page_mkwrite(vmf, NULL);
> 
> (I guess there's no helper that could be used directly in .page_mkwrite
> op?)

I could provide a helper that just supplies NULL as the second argument.  I
think only 9p will use it, but that's fine.

David

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

