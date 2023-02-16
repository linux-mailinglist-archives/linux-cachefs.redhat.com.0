Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 209DA69967C
	for <lists+linux-cachefs@lfdr.de>; Thu, 16 Feb 2023 15:00:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1676556002;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=OkiwbNdujRZuBZGIaDdbrIKM4wLXePBlfvbSJF5d/8k=;
	b=Zn0gbZZYmtYbjrJD+GsNX3aArPxw+oozSHPbKdHIFjaD0/l2Uq6cV+TQXWbcrRKQwtF1ok
	ATe0Gd4Gw9rbkZq+EH4Ss5dzRmvCRi+PhWmlGCac18m6ZyVyW11e1UYoCwnE+py8xAmJxj
	XEysa2c+HVbeAIk4ArVjFJQEn+kC0YA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-365-_iHs6J0kMCavs1Z0fBVaRA-1; Thu, 16 Feb 2023 08:59:58 -0500
X-MC-Unique: _iHs6J0kMCavs1Z0fBVaRA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B09AC293248F;
	Thu, 16 Feb 2023 13:59:57 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E8D79492B15;
	Thu, 16 Feb 2023 13:59:53 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 4CD0B194658D;
	Thu, 16 Feb 2023 13:59:53 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id D5FF91946588 for <linux-cachefs@listman.corp.redhat.com>;
 Thu, 16 Feb 2023 13:59:37 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 47CF4492B17; Thu, 16 Feb 2023 13:59:37 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4010C492B15
 for <linux-cachefs@redhat.com>; Thu, 16 Feb 2023 13:59:37 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 23D48886069
 for <linux-cachefs@redhat.com>; Thu, 16 Feb 2023 13:59:37 +0000 (UTC)
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-96-CtRgdm0yP5Sc-uPYaxSlxg-1; Thu, 16 Feb 2023 08:59:35 -0500
X-MC-Unique: CtRgdm0yP5Sc-uPYaxSlxg-1
Received: by mail-pl1-f200.google.com with SMTP id
 jn16-20020a170903051000b00198f5741d23so1060689plb.18
 for <linux-cachefs@redhat.com>; Thu, 16 Feb 2023 05:59:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xEH9h33TQSqPPiPDsBdeDp7ByTBzbtZLpeGkYEW8pJk=;
 b=KtvGgjDJpIZ8Nd6PNeWCZ3xxjeQvQbhDZfUJk+DLdEz7BZ27N2T1+gMGe1Sg8Zu6DK
 2MMxAKXqropn78LROJirwA0B7kPMpcwBHf9q4CepjH3ixki2tSVENN+bC8vgDKmTtjXa
 +pJHN0iFjuVfxSRzkfxIYoSdcavpbhtjJUAVPKlIUpDYM0jSFiApniYG8sZTsPvSkGP7
 ux5SxNoorINQnaBcD3T7/4hYW6EoqEEn6nO6dTW3G9KXFQvfsyUqu2UAolqo5JJaODMi
 NMXOP4kA9e2jY4pZGF7rgCD7Kza3Sk5frtvwhJr6jZfOwk7+DTvULKBDQQ4UleQ9n5Ux
 xPgw==
X-Gm-Message-State: AO0yUKXyigDcI8K1oqQEne7xdhO9lHriseSCCwDl5ZX7oFfdHr+vx9qd
 0RUEeIS6vYooKAGFSKNztIxGzXl5FySWhLRHT8V28KydTwP562cShdazJXcB+qaq7H7x4zMbJzB
 OWOPXntg25SNacngknZZyCL9r4UpBQLLdrVnfWw==
X-Received: by 2002:a63:375a:0:b0:4cd:fd18:8ccb with SMTP id
 g26-20020a63375a000000b004cdfd188ccbmr792430pgn.43.1676555974850; 
 Thu, 16 Feb 2023 05:59:34 -0800 (PST)
X-Google-Smtp-Source: AK7set+fnE4zZrwJsp2nenn4dAhNJXa5kjnLl2S0zfctKiolwaM2jNY3wF/FKP7SRJni882H8wLcwDW2NvsCxga0P3o=
X-Received: by 2002:a63:375a:0:b0:4cd:fd18:8ccb with SMTP id
 g26-20020a63375a000000b004cdfd188ccbmr792412pgn.43.1676555974531; Thu, 16 Feb
 2023 05:59:34 -0800 (PST)
MIME-Version: 1.0
References: <167172131368.2334525.8569808925687731937.stgit@warthog.procyon.org.uk>
 <167172133121.2334525.2608800018126833569.stgit@warthog.procyon.org.uk>
In-Reply-To: <167172133121.2334525.2608800018126833569.stgit@warthog.procyon.org.uk>
From: David Wysochanski <dwysocha@redhat.com>
Date: Thu, 16 Feb 2023 08:58:58 -0500
Message-ID: <CALF+zO=P1QbKmyE7c+4CQZyWKM5PeU1GqgPxUnerWc9B03OxCA@mail.gmail.com>
To: David Howells <dhowells@redhat.com>, Matthew Wilcox <willy@infradead.org>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Subject: Re: [Linux-cachefs] [PATCH v5 2/3] mm, netfs,
 fscache: Stop read optimisation when folio removed from pagecache
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-cachefs>, 
 <mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/linux-cachefs/>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-cachefs>,
 <mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Cc: Shyam Prasad N <nspmangalore@gmail.com>, linux-cifs@vger.kernel.org,
 linux-nfs@vger.kernel.org, Rohith Surabattula <rohiths.msft@gmail.com>,
 Jeff Layton <jlayton@kernel.org>, Dominique Martinet <asmadeus@codewreck.org>,
 ceph-devel@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-erofs@lists.ozlabs.org, Steve French <sfrench@samba.org>,
 linux-mm@kvack.org, linux-cachefs@redhat.com, linux-ext4@lists.ozlabs.org,
 linux-fsdevel@vger.kernel.org, v9fs-developer@lists.sourceforge.net,
 Ilya Dryomov <idryomov@gmail.com>,
 Linus Torvalds <torvalds@linux-foundation.org>, linux-afs@lists.infradead.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Dec 22, 2022 at 10:02 AM David Howells <dhowells@redhat.com> wrote:
>
> Fscache has an optimisation by which reads from the cache are skipped until
> we know that (a) there's data there to be read and (b) that data isn't
> entirely covered by pages resident in the netfs pagecache.  This is done
> with two flags manipulated by fscache_note_page_release():
>
>         if (...
>             test_bit(FSCACHE_COOKIE_HAVE_DATA, &cookie->flags) &&
>             test_bit(FSCACHE_COOKIE_NO_DATA_TO_READ, &cookie->flags))
>                 clear_bit(FSCACHE_COOKIE_NO_DATA_TO_READ, &cookie->flags);
>
> where the NO_DATA_TO_READ flag causes cachefiles_prepare_read() to indicate
> that netfslib should download from the server or clear the page instead.
>
> The fscache_note_page_release() function is intended to be called from
> ->releasepage() - but that only gets called if PG_private or PG_private_2
> is set - and currently the former is at the discretion of the network
> filesystem and the latter is only set whilst a page is being written to the
> cache, so sometimes we miss clearing the optimisation.
>
> Fix this by following Willy's suggestion[1] and adding an address_space
> flag, AS_RELEASE_ALWAYS, that causes filemap_release_folio() to always call
> ->release_folio() if it's set, even if PG_private or PG_private_2 aren't
> set.
>
> Note that this would require folio_test_private() and page_has_private() to
> become more complicated.  To avoid that, in the places[*] where these are
> used to conditionalise calls to filemap_release_folio() and
> try_to_release_page(), the tests are removed the those functions just
> jumped to unconditionally and the test is performed there.
>
> [*] There are some exceptions in vmscan.c where the check guards more than
> just a call to the releaser.  I've added a function, folio_needs_release()
> to wrap all the checks for that.
>
> AS_RELEASE_ALWAYS should be set if a non-NULL cookie is obtained from
> fscache and cleared in ->evict_inode() before truncate_inode_pages_final()
> is called.
>
> Additionally, the FSCACHE_COOKIE_NO_DATA_TO_READ flag needs to be cleared
> and the optimisation cancelled if a cachefiles object already contains data
> when we open it.
>
> Changes:
> ========
> ver #4)
>  - Split out merging of folio_has_private()/filemap_release_folio() call
>    pairs into a preceding patch.
>  - Don't need to clear AS_RELEASE_ALWAYS in ->evict_inode().
>
> ver #3)
>  - Fixed mapping_clear_release_always() to use clear_bit() not set_bit().
>  - Moved a '&&' to the correct line.
>
> ver #2)
>  - Rewrote entirely according to Willy's suggestion[1].
>
> Reported-by: Rohith Surabattula <rohiths.msft@gmail.com>
> Suggested-by: Matthew Wilcox <willy@infradead.org>
> Signed-off-by: David Howells <dhowells@redhat.com>
> cc: Matthew Wilcox <willy@infradead.org>
> cc: Linus Torvalds <torvalds@linux-foundation.org>
> cc: Steve French <sfrench@samba.org>
> cc: Shyam Prasad N <nspmangalore@gmail.com>
> cc: Rohith Surabattula <rohiths.msft@gmail.com>
> cc: Dave Wysochanski <dwysocha@redhat.com>
> cc: Dominique Martinet <asmadeus@codewreck.org>
> cc: Ilya Dryomov <idryomov@gmail.com>
> cc: linux-cachefs@redhat.com
> cc: linux-cifs@vger.kernel.org
> cc: linux-afs@lists.infradead.org
> cc: v9fs-developer@lists.sourceforge.net
> cc: ceph-devel@vger.kernel.org
> cc: linux-nfs@vger.kernel.org
> cc: linux-fsdevel@vger.kernel.org
> cc: linux-mm@kvack.org
>
> Link: https://lore.kernel.org/r/Yk9V/03wgdYi65Lb@casper.infradead.org/ [1]
> Link: https://lore.kernel.org/r/164928630577.457102.8519251179327601178.stgit@warthog.procyon.org.uk/ # v1
> Link: https://lore.kernel.org/r/166844174069.1124521.10890506360974169994.stgit@warthog.procyon.org.uk/ # v2
> Link: https://lore.kernel.org/r/166869495238.3720468.4878151409085146764.stgit@warthog.procyon.org.uk/ # v3
> Link: https://lore.kernel.org/r/1459152.1669208550@warthog.procyon.org.uk/ # v3 also
> Link: https://lore.kernel.org/r/166924372614.1772793.3804564782036202222.stgit@warthog.procyon.org.uk/ # v4
> ---
>
>  fs/9p/cache.c           |    2 ++
>  fs/afs/internal.h       |    2 ++
>  fs/cachefiles/namei.c   |    2 ++
>  fs/ceph/cache.c         |    2 ++
>  fs/cifs/fscache.c       |    2 ++
>  include/linux/pagemap.h |   16 ++++++++++++++++
>  mm/internal.h           |    5 ++++-
>  7 files changed, 30 insertions(+), 1 deletion(-)
>
> diff --git a/fs/9p/cache.c b/fs/9p/cache.c
> index cebba4eaa0b5..12c0ae29f185 100644
> --- a/fs/9p/cache.c
> +++ b/fs/9p/cache.c
> @@ -68,6 +68,8 @@ void v9fs_cache_inode_get_cookie(struct inode *inode)
>                                        &path, sizeof(path),
>                                        &version, sizeof(version),
>                                        i_size_read(&v9inode->netfs.inode));
> +       if (v9inode->netfs.cache)
> +               mapping_set_release_always(inode->i_mapping);
>
>         p9_debug(P9_DEBUG_FSC, "inode %p get cookie %p\n",
>                  inode, v9fs_inode_cookie(v9inode));
> diff --git a/fs/afs/internal.h b/fs/afs/internal.h
> index 9ba7b68375c9..8e4afaeb6bff 100644
> --- a/fs/afs/internal.h
> +++ b/fs/afs/internal.h
> @@ -680,6 +680,8 @@ static inline void afs_vnode_set_cache(struct afs_vnode *vnode,
>  {
>  #ifdef CONFIG_AFS_FSCACHE
>         vnode->netfs.cache = cookie;
> +       if (cookie)
> +               mapping_set_release_always(vnode->netfs.inode.i_mapping);
>  #endif
>  }
>
> diff --git a/fs/cachefiles/namei.c b/fs/cachefiles/namei.c
> index 03ca8f2f657a..50b2ee163af6 100644
> --- a/fs/cachefiles/namei.c
> +++ b/fs/cachefiles/namei.c
> @@ -584,6 +584,8 @@ static bool cachefiles_open_file(struct cachefiles_object *object,
>         if (ret < 0)
>                 goto check_failed;
>
> +       clear_bit(FSCACHE_COOKIE_NO_DATA_TO_READ, &object->cookie->flags);
> +
>         object->file = file;
>
>         /* Always update the atime on an object we've just looked up (this is
> diff --git a/fs/ceph/cache.c b/fs/ceph/cache.c
> index 177d8e8d73fe..de1dee46d3df 100644
> --- a/fs/ceph/cache.c
> +++ b/fs/ceph/cache.c
> @@ -36,6 +36,8 @@ void ceph_fscache_register_inode_cookie(struct inode *inode)
>                                        &ci->i_vino, sizeof(ci->i_vino),
>                                        &ci->i_version, sizeof(ci->i_version),
>                                        i_size_read(inode));
> +       if (ci->netfs.cache)
> +               mapping_set_release_always(inode->i_mapping);
>  }
>
>  void ceph_fscache_unregister_inode_cookie(struct ceph_inode_info *ci)
> diff --git a/fs/cifs/fscache.c b/fs/cifs/fscache.c
> index f6f3a6b75601..79e9665dfc90 100644
> --- a/fs/cifs/fscache.c
> +++ b/fs/cifs/fscache.c
> @@ -108,6 +108,8 @@ void cifs_fscache_get_inode_cookie(struct inode *inode)
>                                        &cifsi->uniqueid, sizeof(cifsi->uniqueid),
>                                        &cd, sizeof(cd),
>                                        i_size_read(&cifsi->netfs.inode));
> +       if (cifsi->netfs.cache)
> +               mapping_set_release_always(inode->i_mapping);
>  }
>
>  void cifs_fscache_unuse_inode_cookie(struct inode *inode, bool update)
> diff --git a/include/linux/pagemap.h b/include/linux/pagemap.h
> index 29e1f9e76eb6..a0d433e0addd 100644
> --- a/include/linux/pagemap.h
> +++ b/include/linux/pagemap.h
> @@ -199,6 +199,7 @@ enum mapping_flags {
>         /* writeback related tags are not used */
>         AS_NO_WRITEBACK_TAGS = 5,
>         AS_LARGE_FOLIO_SUPPORT = 6,
> +       AS_RELEASE_ALWAYS,      /* Call ->release_folio(), even if no private data */
>  };
>
>  /**
> @@ -269,6 +270,21 @@ static inline int mapping_use_writeback_tags(struct address_space *mapping)
>         return !test_bit(AS_NO_WRITEBACK_TAGS, &mapping->flags);
>  }
>
> +static inline bool mapping_release_always(const struct address_space *mapping)
> +{
> +       return test_bit(AS_RELEASE_ALWAYS, &mapping->flags);
> +}
> +
> +static inline void mapping_set_release_always(struct address_space *mapping)
> +{
> +       set_bit(AS_RELEASE_ALWAYS, &mapping->flags);
> +}
> +
> +static inline void mapping_clear_release_always(struct address_space *mapping)
> +{
> +       clear_bit(AS_RELEASE_ALWAYS, &mapping->flags);
> +}
> +
>  static inline gfp_t mapping_gfp_mask(struct address_space * mapping)
>  {
>         return mapping->gfp_mask;
> diff --git a/mm/internal.h b/mm/internal.h
> index c4c8e58e1d12..5421ce8661fa 100644
> --- a/mm/internal.h
> +++ b/mm/internal.h
> @@ -168,7 +168,10 @@ static inline void set_page_refcounted(struct page *page)
>   */
>  static inline bool folio_needs_release(struct folio *folio)
>  {
> -       return folio_has_private(folio);
> +       struct address_space *mapping = folio->mapping;
> +
> +       return folio_has_private(folio) ||
> +               (mapping && mapping_release_always(mapping));
>  }
>
>  extern unsigned long highest_memmap_pfn;
>
>

What is the status of this patch?  I think it may be stalled but I'm not sure
if maybe it's in progress behind the scenes, or in someone's testing tree?

FWIW, this is still needed for the NFS netfs conversion patches [1]
(I will post a v11 soon), to avoid a perf regression seen by my unit
tests as well as by Daire Byrne and Ben Maynard re-export environments.

Thanks.

[1] https://marc.info/?l=linux-nfs&m=166749188616723&w=4

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

