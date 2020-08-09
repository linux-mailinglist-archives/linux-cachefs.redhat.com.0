Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id ABCBE23FFA7
	for <lists+linux-cachefs@lfdr.de>; Sun,  9 Aug 2020 20:08:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1596996535;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=roVnu9oipjNEkIdu0uw5JGP8JKWwX6bKCS2ViZNkqZg=;
	b=X7BpUCp26peeBQjPBH7FYPweXkXJzJ5vNMPUaYRydBRvm0M/6IhYQaR0QnV1i+/FxwEuD6
	oKXv4TKEPYyWoCRAD8Jzra+iWaqhc9lNaAmPowwjsJd5PuONuu0/O1Sj2ehSdjr7qdprho
	kK9opaP/qVV6Gkf9yqUOinbGpH471Gk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-347-yCA8F8esP8motcZiuXIHgA-1; Sun, 09 Aug 2020 14:08:53 -0400
X-MC-Unique: yCA8F8esP8motcZiuXIHgA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1DE7E18FF697;
	Sun,  9 Aug 2020 18:08:51 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7B3768AD1C;
	Sun,  9 Aug 2020 18:08:49 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4506097529;
	Sun,  9 Aug 2020 18:08:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 079I6k8s011553 for <linux-cachefs@listman.util.phx.redhat.com>;
	Sun, 9 Aug 2020 14:06:46 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E4E7520316D5; Sun,  9 Aug 2020 18:06:45 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E07432026D5D
	for <linux-cachefs@redhat.com>; Sun,  9 Aug 2020 18:06:42 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BC1CF80067A
	for <linux-cachefs@redhat.com>; Sun,  9 Aug 2020 18:06:42 +0000 (UTC)
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
	[209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-328-iXpQzbsXM3m6oQZU458DgQ-1; Sun, 09 Aug 2020 14:06:41 -0400
X-MC-Unique: iXpQzbsXM3m6oQZU458DgQ-1
Received: by mail-ej1-f71.google.com with SMTP id r14so3039369eji.16
	for <linux-cachefs@redhat.com>; Sun, 09 Aug 2020 11:06:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ATZD93zD/5kml4N0Lur3x9hiFQeSGJ6fJZXGFW41Qjo=;
	b=VV5bcN5GYHHJ16vCTotnttmN7+PJS5cs2eL3ecbnS4xGv4oHPyCg8skpcB9O2YBQFy
	41SrDmi1FoNwzWFlL5Gxc94YEswiOoZSmlVhTr4OXP9kIeIdvj11iC+VvOXLH2KGPAuj
	MwwbCDTWybtDLZ8qdzs62zbL4vDcMhBZywohKO5OU7822a8U7bsoJDTWr3B/Oq4fm2Pc
	16Kb6SETyWRY8B0HZcMnmiqDQc1+oXSOQpgmn8e1NhCsbQOkulRrUCcEk7roycutCZzT
	NhBmaPwTzNnbm6p8zbzbRmaBFU2EzpCPJS966076e7POdavXBNWMtf4muN44cpIYejJf
	7Kjg==
X-Gm-Message-State: AOAM531ffWyR4kRZy4JwpeVfhh5i2QmaabZw1D0GLb6pJ9cCQEYAZy44
	W7KGetZ+8DqRFkUl0DT2FaV/0jTN140gqq5G7Y5LpyF0Vmwgxw82+3YpSrQCIL8+PePPoTP+rqT
	Tl4SwclvGOnF6loIH6VHDpXn2oQuAO2jcUB79hQ==
X-Received: by 2002:a17:906:a4b:: with SMTP id
	x11mr19396735ejf.83.1596996399761; 
	Sun, 09 Aug 2020 11:06:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxLqdQu7vRltloFG/05zd/F+9/oFGFtH6vc2JCkVRf4G+cJVzGcg3eChnWvhKhTz+um6uw1MSAHMU0xmWl5wbc=
X-Received: by 2002:a17:906:a4b:: with SMTP id
	x11mr19396716ejf.83.1596996399490; 
	Sun, 09 Aug 2020 11:06:39 -0700 (PDT)
MIME-Version: 1.0
References: <20200731130421.127022-1-jlayton@kernel.org>
	<20200731130421.127022-10-jlayton@kernel.org>
In-Reply-To: <20200731130421.127022-10-jlayton@kernel.org>
From: David Wysochanski <dwysocha@redhat.com>
Date: Sun, 9 Aug 2020 14:06:03 -0400
Message-ID: <CALF+zOnQ6diJv4bMbf-HSYmHusT_iE1dAqp-j_kjuqyLqfp-nw@mail.gmail.com>
To: Jeff Layton <jlayton@kernel.org>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: linux-cachefs@redhat.com
Cc: ceph-devel@vger.kernel.org, linux-cachefs@redhat.com, idryomov@gmail.com
Subject: Re: [Linux-cachefs] [RFC PATCH v2 09/11] ceph: convert readpages to
	fscache_read_helper
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Jul 31, 2020 at 9:05 AM Jeff Layton <jlayton@kernel.org> wrote:
> +static int ceph_readpages(struct file *file, struct address_space *mapping,
> +                         struct list_head *page_list, unsigned nr_pages)
>  {
...
> +       int max = fsc->mount_options->rsize >> PAGE_SHIFT;
...
> +               ret = fscache_read_helper_page_list(&req->fscache_req, page_list, max);

Looks like the root of my problems is that the 'max_pages' parameter
given to fscache_read_helper_page_list() does not work for purposes of
limiting the IO to the 'rsize'.  That is, the fscache_io_request.nr_pages
exceeds 'max_pages' and becomes readahead_size.  So even though
max_pages is based on 'rsize', when issue_op() is called, it is for a
fscache_io_request that exceeds 'rsize', resulting in multiple NFS
reads that go over the wire and multiple completions, each of
which end up calling back into io_done() which blows up
because fscache does not expect this.  Looks like
fscache_shape_request() overrides any 'max_pages'
value (actually it is cachefiles_shape_request) , so it's
unclear why the netfs would pass in a 'max_pages' if it is
not honored - seems like a bug maybe or it's not obvious
what the purpose is there.  I tried a custom 'shape' method
and got further, but it blew up on another test, so I'm not sure.

It would be good to know if this somehow works for you but my guess is
you'll see similar failures when rsize < readahead_size == size_of_readpages.

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

